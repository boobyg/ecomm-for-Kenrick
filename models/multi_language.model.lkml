connection: "ecomm_borisglazmanextensionframework"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

include: "/dashboards/*.dashboard.lookml"

datagroup: factures_default_datagroup {
  #sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "999999 hour"
  sql_trigger: FALSE ;;
}

datagroup: factures_aggregate_datagroup {
  sql_trigger: SELECT CURRENT_DATE() ;;
  max_cache_age: "1 hour"
}

 label:"modèle.multi_langue"

# persist_with: factures_default_datagroup
# # to demo a column-level security
# access_grant: sensitive {
#   user_attribute: org_role
#   allowed_values: ["management", "finance"]
# }

explore: events {                                         # user attributes
 label: "Événements multilingues"
  view_label: "Événements"
  access_filter: {
    field: users.country
    user_attribute:country
  }

  join: users {
    view_label: "utilisateur / utilisatrice"
    type: full_outer
    relationship: one_to_many
    sql_on: ${users.id} = ${events.user_id};;
  }

    access_filter: {
    # field: users.code_langue
    # user_attribute: locale
    field: users.store_type
    user_attribute: store_type
  }
}


# explore: factures{
#   # symmetric_aggregates: no
#   # sql_table_name: factures

#   ## row-level access control based on company code
#   # access_filter: {
#   #   field: factures.company_code
#   #   user_attribute: company_code
#   # }
#   ## row-level access control based on sales org
#   # access_filter: {
#   #   field: factures.sales_organization
#   #   user_attribute: sales_org
#   # }
#   ## row-level access control based on profit center
#   # access_filter: {
#   #   field: factures.centre_profit
#   #   user_attribute: profit_center
#   # }

#   sql_table_name:
#   {% if invoice_number._in_query %}
#   client.factures
#   {% else %}
#   client.factures_aggr
#   {% endif %} ;;

#   access_filter: {
#     field: ref_segmentation_client.code_langue
#     user_attribute: code_langue
#   }

#   access_filter: {
#     field: ref_segmentation_expertise.code_langue
#     user_attribute: code_langue
#   }

#   access_filter: {
#     field: ref_segmentation_metier.code_langue
#     user_attribute: code_langue
#   }

#   access_filter: {
#     field: ref_segmentation_procede.code_langue
#     user_attribute: code_langue
#   }

#   access_filter: {
#     field: admin_rights.user_id
#     user_attribute: id
#   }

#   always_filter: {
#     filters: [taux_devises.devise_cible: "EUR", factures.fiscal_date: "last year"]
#   }

#   label: "explore.factures"

#   #aggregate_table: factures_aggregate {
#   #  query: {
#   #    dimensions: [
#   #      factures.osmose_entreprise,
#   #      factures.sold_to,
#   #      factures.period_currency,
#   #      factures.fiscal_date,
#   #      factures.segmentation_client_clef_source,
#   #      factures.segmentation_expertise_clef_source_not_null,
#   #      factures.segmentation_metier_clef_source,
#   #      factures.segmentation_procede_clef_source,
#   #      partner_link.partner_libelle,
#   #      taux_devises.devise_cible,
#   #      ref_segmentation_client.code_langue,
#   #      ref_segmentation_expertise.code_langue,
#   #      ref_segmentation_metier.code_langue,
#   #      ref_segmentation_procede.code_langue,
#   #      admin_rights.user_id
#   #    ]
#   #    measures: [
#   #      factures.total_net_amount,
#   #      factures.total_vat_amount
#   #    ]
#   #    filters: [
#   #      partner_link.select_analysis: "subsidiary"
#   #    ]
#   #  }
#   #  materialization: {
#   #    datagroup_trigger: factures_aggregate_datagroup
#   #  }
#   #}

#   fields: [
#     factures.invoice_number,
#     factures.item_number,
#     factures.fiscal_date,
#     factures.currency,
#     factures.sold_to,
#     factures.company_code,
#     factures.sales_organization,
#     factures.centre_profit,
#     factures.total_net_amount_conv,
#     factures.total_vat_amount_conv,
#     factures.number_invoices,
#     factures.osmose_entreprise,
#     factures.period_currency,
#     factures.segmentation_client_clef_source,
#     factures.segmentation_expertise_clef_source_not_null,
#     factures.segmentation_metier_clef_source,
#     factures.segmentation_procede_clef_source,
#     orga_entreprise.division_libelle,
#     orga_entreprise.pole_libelle,
#     orga_entreprise.direction_libelle,
#     orga_entreprise.entreprise_libelle,
#     partner.name,
#     partner.city,
#     partner.country,
#     partner.partner_type,
#     partner_link.partner_libelle,
#     partner_link.select_analysis,
#     taux_devises.devise_source,
#     taux_devises.devise_cible,
#     taux_devises.taux2,
#     ref_segmentation_client.code_langue,
#     ref_segmentation_client.segmentation_libelle_n1,
#     ref_segmentation_client.segmentation_libelle_n2,
#     ref_segmentation_client.segmentation_libelle_n3,
#     ref_segmentation_client.segmentation_libelle_filter_aware,
#     ref_segmentation_client.segmentation_client_hierarchy_aware,
#     ref_segmentation_expertise.code_langue,
#     ref_segmentation_expertise.segmentation_libelle_n1,
#     ref_segmentation_expertise.segmentation_libelle_n2,
#     ref_segmentation_expertise.segmentation_libelle_n3,
#     ref_segmentation_metier.code_langue,
#     ref_segmentation_metier.segmentation_libelle_n1,
#     ref_segmentation_procede.code_langue,
#     ref_segmentation_procede.segmentation_libelle_n1,
#     ref_segmentation_procede.segmentation_libelle_n2,
#     ref_segmentation_procede.segmentation_libelle_n3,
#     admin_rights.user_id,
#     admin_rights.division_id
#   ]

#   always_join: [orga_entreprise, admin_rights]

#   join: orga_entreprise {
#     relationship: many_to_one
#     sql_on: ${factures.osmose_entreprise} = ${orga_entreprise.osmose_entreprise} ;;
#     fields: [
#       orga_entreprise.entreprise_libelle,
#       orga_entreprise.direction_libelle,
#       orga_entreprise.pole_libelle,
#       orga_entreprise.division_libelle
#     ]
#   }

#   join: admin_rights {
#     relationship: many_to_many
#     sql_on: ${admin_rights.division_id} = ${orga_entreprise.division_id} ;;
#   }

#   join: partner {
#     type:  inner
#     relationship: many_to_one
#     sql_on: ${factures.sold_to} = ${partner.customer_number} ;;
#     fields: [
#       partner.name,
#       partner.city,
#       partner.country,
#       partner.partner_type
#     ]
#   }

#   join: partner_link {
#     type: inner
#     relationship: many_to_one
#     sql_on: ${partner.subsidiary_id} = ${partner_link.subsidiary_id} ;;
#     fields: [
#       partner_link.partner_libelle
#     ]
#   }

#   join: taux_devises {
#     relationship: many_to_many
#     sql_on: ${factures.period_currency} = ${taux_devises.period_currency} ;;
#     fields: [
#       taux_devises.devise_source,
#       taux_devises.devise_cible,
#       taux_devises.taux2
#     ]
#   }

#   join: ref_segmentation_client {
#     relationship: many_to_many
#     sql_on: ${factures.segmentation_client_clef_source} = ${ref_segmentation_client.segmentation_id} ;;
#     fields: [
#       ref_segmentation_client.code_langue,
#       ref_segmentation_client.segmentation_libelle_n1,
#       ref_segmentation_client.segmentation_libelle_n2,
#       ref_segmentation_client.segmentation_libelle_n3
#     ]
#   }

#   join: ref_segmentation_expertise {
#     relationship: many_to_many
#     sql_on: ${factures.segmentation_expertise_clef_source_not_null} = ${ref_segmentation_expertise.segmentation_id} ;;
#     fields: [
#       ref_segmentation_expertise.code_langue,
#       ref_segmentation_expertise.segmentation_libelle_n1,
#       ref_segmentation_expertise.segmentation_libelle_n2,
#       ref_segmentation_expertise.segmentation_libelle_n3
#     ]
#   }

#   join: ref_segmentation_metier {
#     relationship: many_to_many
#     sql_on: ${factures.segmentation_metier_clef_source} = ${ref_segmentation_metier.segmentation_id} ;;
#     fields: [
#       ref_segmentation_metier.code_langue,
#       ref_segmentation_metier.segmentation_libelle_n1
#     ]
#   }

#   join: ref_segmentation_procede {
#     relationship: many_to_many
#     sql_on: ${factures.segmentation_procede_clef_source} = ${ref_segmentation_procede.segmentation_id} ;;
#     fields: [
#       ref_segmentation_procede.code_langue,
#       ref_segmentation_procede.segmentation_libelle_n1,
#       ref_segmentation_procede.segmentation_libelle_n2,
#       ref_segmentation_procede.segmentation_libelle_n3
#     ]
#   }
# }
