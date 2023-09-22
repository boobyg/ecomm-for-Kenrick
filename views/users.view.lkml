view: users {
  sql_table_name: `ecomm.users`
    ;;
  drill_fields: [id]
#  extension: required

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    label: " 🚗 User ID  Group 🚎 "
    description: "This is a grouping of users 🚍"
  }

  dimension: age {
    type: number
    label: "Age of the User"
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    tags: ["city"]
    sql: ${TABLE}.city ;;
    suggestable: no
#    full_suggestions: no  #Carrefour LS connector perf

    }


# #### test parameters Carrefour LS connector perf ##############

#     parameter: cities {
#     type: string
#     allowed_value: {
#       label: "New York"
#       value: "New York"
#     }
#     allowed_value: {
#       label: "Los Angeles"
#       value: "Los Angeles"
#     }
#   }


#   dimension: city2 {
#     type: string
#     sql:       {% parameter cities %} ;;
#   }
# ##################### end test parrameteres #########################


  dimension: country {
    type: string
    tags: ["country"]
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
    tags: ["email"]
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    tags: ["first_name"]
    type: string

    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    tags: ["last_name"]
    sql: ${TABLE}.last_name ;;
  }

dimension:full_name {
  type: string
  sql: CONCAT(${first_name}, ${last_name}) ;;
}

  dimension: location {
    type: location
     sql_latitude: ${TABLE}.latitude ;;
     sql_longitude: ${TABLE}.longitude ;;
    }

  dimension: state {
    type: string
    tags: ["state"]
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type: zipcode
    tags: ["zip"]
    sql: ${TABLE}.zip ;;
  }
  dimension: code_langue {
    type: string
    sql: "en" ;;
  }

  dimension: store_type{
    type: string
    sql: "Hyper" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, last_name, first_name, events.count, order_items.count]
  }
}
