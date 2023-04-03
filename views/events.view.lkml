view: events {
  sql_table_name: `ecomm.events`
    ;;
  drill_fields: [id]

  parameter: big_search_filter {   #testing BQ Big Search ... see .mdl
    suggestable: no
    type: unquoted
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    group_label: "Group IDs"
  }

  dimension: ad_event_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.ad_event_id ;;
    group_label: "Group IDs"
    }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension: referrer_code {
    type: string
    sql: ${TABLE}.referrer_code ;;
  }

  dimension: sequence_number {
    type: number
    sql: ${TABLE}.sequence_number ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: uri {
    type: string
    sql: ${TABLE}.uri ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [id, ad_events.id, users.last_name, users.id, users.first_name]
  }

  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: { value: "Time" }
    allowed_value: { value: "Date" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    default_value: "Date"
  }
  dimension: dynamic_timeframe {
    type: string
    sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'Time' THEN CAST(${created_time}AS STRING)
    WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${created_date}AS STRING)
    WHEN {% parameter timeframe_picker %} = 'Week' THEN CAST(${created_week}AS STRING)
    WHEN {% parameter timeframe_picker %} = 'Month' THEN CAST(${created_month}AS STRING)
    END ;;
  }
}
