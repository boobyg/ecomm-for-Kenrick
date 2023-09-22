include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
view: users_extended {
  sql_table_name: `ecomm.users`  ;;
  drill_fields: [id]
  extends: [users]

dimension: id_extended {
#  primary_key: yes
  type: number
  sql: ${TABLE}.id ;;
  label: " 🚗 User ID  Group Extended🚎 "
  description: "This is a grouping of users 🚍"
}

measure: count_extended {
  type: count
}
}
