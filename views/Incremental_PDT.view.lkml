view: incremental_pdt {
# If necessary, uncomment the line below to include explore_source.
# # include: "ecomm.model.lkml"
#     derived_table: {
# #      indexes: ["user_id"]
#       increment_key: "created_date"
#       increment_offset: 3
# #      datagroup_trigger: ecomm_default_datagroup
#       explore_source: events {
#         column: created_date {}
#         column: referrer_code {}
#         column: traffic_source {}
#         column: user_id {}
#         column: uri {}
#       }
# #      persist_for: "24 hours"
#     }
#     dimension: created_date {
#       type: date
#     }
#     dimension: referrer_code {}
#     dimension: traffic_source {}
#     dimension: user_id {
#       type: number
#     }
#     dimension: uri {}

#     measure: count {
#       type: count
#     }
#     measure: count_2
#     {
#     type: number
#     sql:  ${count} * 1.2 ;;

#     }
  }
