project_name: "ecomm"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "Bel"
#  override_constant: CONNECTION_NAME { value:"google_analytics_sample" }
#}
localization_settings: {
  default_locale: en
  localization_level: permissive
}

constant: currency_html {

  value: "
  {% if currency_parameter._parameter_value == 'EURO' %}
  €
  {% else %}
  {% if copa.COUNTRY._in_query or copa.filter_on_country._in_query %}
  {{ dim_compass_bu.currency_code._value }}
  {% else %}
  €
  {% endif %}
  {% endif %}"
}
