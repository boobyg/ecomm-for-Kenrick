view: sql_runner_query {
  derived_table: {
    sql: select * from `borisglazmanextensionframework.my_connected_factory.equipment`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

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

  dimension: equipment_id {
    type: string
    sql: ${TABLE}.Equipment_id ;;
  }

  dimension: equipment_category {
    type: string
    sql: ${TABLE}.EquipmentCategory ;;
  }

  dimension: equipment_type {
    type: string
    sql: ${TABLE}.EquipmentType ;;
  }

  dimension: plant_id {
    type: string
    sql: ${TABLE}.Plant_id ;;
  }

  dimension: plant_area_id {
    type: string
    sql: ${TABLE}.PlantArea_id ;;
  }

  dimension: plant_unit_id {
    type: string
    sql: ${TABLE}.PlantUnit_id ;;
  }

  dimension: site_id {
    type: string
    sql: ${TABLE}.Site_id ;;
  }

  set: detail {
    fields: [
      company_id,
      created_at,
      equipment,
      equipment_id,
      equipment_category,
      equipment_type,
      plant_id,
      plant_area_id,
      plant_unit_id,
      site_id
    ]
  }
}
