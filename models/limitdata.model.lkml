connection: "ecomm"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project


datagroup: ecomm_default_datagroup {
#  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hour"
}

persist_with: ecomm_default_datagroup

explore: order_items {
  from: order_items
  #sql_always_where: ${created_date} > "2017-1-1" ;;
  always_filter: {
    filters: [sale_price: "> 50", created_date: "3 years"]
  }

}
