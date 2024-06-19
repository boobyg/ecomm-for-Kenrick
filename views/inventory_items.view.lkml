view: inventory_items {
  sql_table_name: `ecomm.inventory_items`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_at ;;
  }

  dimension: product_brand {
    type: string
    sql: ${TABLE}.product_brand ;;
  }

  dimension: product_category {
    type: string
    sql: ${TABLE}.product_category ;;
  }

  dimension: product_department {
    type: string
    sql: ${TABLE}.product_department ;;
  }

  dimension: product_distribution_center_id {
    type: number
    sql: ${TABLE}.product_distribution_center_id ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_name {
    type: string
    sql: ${TABLE}.product_name ;;
  }

  dimension: product_retail_price {
    type: number
    sql: ${TABLE}.product_retail_price ;;
  }

  dimension: product_sku {
    type: string
    sql: ${TABLE}.product_sku ;;
  }

  dimension_group: sold {
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
    sql: ${TABLE}.sold_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, product_name, products.name, products.id, order_items.count]
  }

  # Data Actoin for write-back
  dimension: write_back {
    type: string
    sql: ${TABLE}.id ;;
    action: {
      label: "Relevant id?"
      url: "https://us-central1-borisglazmanextensionframework.cloudfunctions.net/looker-write-back"
      param: {
        name: "id"
        value: "{{ value }}"
      }
      form_param: {
        name: "annotation"
        type: select
        label: "Relevand id?"
        default: "No"
        description: "Do you think that this is a relevant id?"
        option: {
        name: "No"
        label: "No"
        }
        option: {
          name: "Yes"
          label: "Yes"
        }
      }
    }
  }

  dimension: write_back_Google_Storage {
    type: string
    sql: ${TABLE}.id ;;
    action: {
      label: "Relevant id?"
      url: "https://us-central1-borisglazmanextensionframework.cloudfunctions.net/looker-write-back"
      param: {
        name: "id"
        value: "{{ value }}"
      }
    }
  }

}
