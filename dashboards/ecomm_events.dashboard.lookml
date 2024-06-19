- dashboard: ecomm_events
  title: ecomm events
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 0mUvLmovuP4Kz9ZKET6Zrd
  elements:
  - title: ecomm events
    name: ecomm events
    model: ecomm
    explore: events
    type: looker_line
    fields: [events.count, events.country, events.created_date]
    pivots: [events.country]
    fill_fields: [events.created_date]
    sorts: [events.country, events.created_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    hidden_pivots: {}
    defaults_version: 1
    listen:
      Country: events.country
    row: 0
    col: 0
    width: 16
    height: 10
  - title: Gender by source
    name: Gender by source
    model: ecomm
    explore: events
    type: looker_donut_multiples
    fields: [users.gender, users.count, users.traffic_source]
    pivots: [users.gender]
    sorts: [users.gender, users.count desc 0]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 12
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen:
      Country: events.country
    row: 0
    col: 16
    width: 8
    height: 10
  filters:
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: inline
    model: ecomm
    explore: events
    listens_to_filters: []
    field: events.country
