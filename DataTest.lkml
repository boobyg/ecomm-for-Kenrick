test: not_null {
  explore_source: events {
    column: browser {}
#    column: device__is_mobile {}
  }

  assert: id_not_null {
    expression: NOT is_null(${events.id}) ;;
  }
}
