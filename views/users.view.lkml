view: users {
  sql_table_name: `ecomm.users`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    label: " 🚗 User ID  Group 🚎 "
    description: "This is a grouping of users 🚍"

  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
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
      # raw,
      # time,
      date,
      week,
      day_of_week_index
      #,
      # month,
      # quarter,
      # year
    ]
    sql:${TABLE}.created_at        ;;

  }
  dimension: week_day {
    sql:CASE when "{{ _user_attributes['locale'] }}"  ="en"  THEN
        if (${created_day_of_week_index} = 1, "Monday","Not Monday")
             when "{{ _user_attributes['locale'] }}"  ="fr"  THEN
        if (${created_day_of_week_index} = 1, "Lundi", "pas Lundi")
    END ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: location {
    type: location
     sql_latitude: ${TABLE}.latitude ;;
     sql_longitude: ${TABLE}.longitude ;;
    }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, events.count, order_items.count]
  }
}
