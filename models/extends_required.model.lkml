connection: "ecomm"
include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
#include: "*.model.lkml"                # include all views in the views/ folder in this project


# # Add extension: required to users view
# explore: users_extended {
# extends: [users]
#   join: events {
#     type: full_outer
#     sql_on: ${events.user_id} = ${users.id} ;;
#     relationship: one_to_many
#   }

#   }
