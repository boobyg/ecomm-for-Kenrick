# The name of this view in Looker is "Equipment"
view: equipment {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `borisglazmanextensionframework.my_connected_factory.equipment`
    ;;
  drill_fields: [equipment_id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: equipment_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.Equipment_id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Company ID" in Explore.

  dimension: company_id {
    type: string
    sql: ${TABLE}.Company_id ;;
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.Created_at ;;
  }

  dimension: equipment {
    type: string
    sql: ${TABLE}.Equipment ;;
  }

  dimension: equipment_category {
    type: string
    sql: ${TABLE}.EquipmentCategory ;;
  }

  dimension: equipment_type {
    type: string
    sql: ${TABLE}.EquipmentType ;;
  }

  dimension: plant_area_id {
    type: string
    sql: ${TABLE}.PlantArea_id ;;
  }

  dimension: plant_id {
    type: string
    sql: ${TABLE}.Plant_id ;;
  }

  dimension: plant_unit_id {
    type: string
    sql: ${TABLE}.PlantUnit_id ;;
  }

  dimension: site_id {
    type: string
    sql: ${TABLE}.Site_id ;;
  }

  measure: count {
    type: count
    drill_fields: [equipment_id]
  }
}
