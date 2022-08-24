connection: "ecomm"
include: "../DataTest.lkml"

# include all the views
include: "/views/**/*.view"
#include: "//test_co1/**/*.view"
datagroup: ecomm_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hour"
}

persist_with: ecomm_default_datagroup

# map_layer: world_admin_map {
#   file: "//test_co1/WB_countries_Admin0_topojson.json"  # need / before the file name
#   property_key: "NAME_EN"
# }

# explore: ga_sessions_20170127 {
#   extends: [ga_sessions_20170127]
#  extension: required
#}

explore: ad_events {
  join: keywords {
    type: left_outer
    sql_on: ${ad_events.keyword_id} = ${keywords.keyword_id} ;;
    relationship: many_to_one
  }
}

explore: ad_groups {
  join: campaigns {
    type: left_outer
    sql_on: ${ad_groups.campaign_id} = ${campaigns.id} ;;
    relationship: many_to_one
    view_label: "Combined"
    }
    group_label: "Regrouped 2 views into 1"
    label: "Regrouped 2 views into 1"
    view_label: "Combined"
}

explore: campaigns {}

explore: connection_reg_r3 {}

explore: distribution_centers {}

explore: events_1{
  from: events
   fields: [ -ALL_FIELDS*, ad_event_id,id    ]                             # minus pour cacher les champs                                                                        commençant par ...(etoile)
}

  explore: events {                                         # user attributes
       access_filter: {
        field: users.country
        user_attribute:country
      }


  join: ad_events {
    type: left_outer
    sql_on: ${events.ad_event_id} = ${ad_events.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: keywords {
    type: left_outer
    sql_on: ${ad_events.keyword_id} = ${keywords.keyword_id} ;;
    relationship: many_to_one
  }
}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: keywords {}

explore: kmeans_training {}

explore: order_items {
  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: products {
  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
  }

explore: users {}
explore: sql_runner_query {}
