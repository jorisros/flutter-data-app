class Dashboard {
  final List<WidgetData> widgets;

  Dashboard({required this.widgets});

  factory Dashboard.fromJson(Map<String, dynamic> json) {
    var list = json['widgets'] as List;
    List<WidgetData> widgetsList = list.map((i) => WidgetData.fromJson(i)).toList();
    return Dashboard(widgets: widgetsList);
  }
}

class WidgetData {
  final String type;
  final Map<String, dynamic> data;

  WidgetData({required this.type, required this.data});

  factory WidgetData.fromJson(Map<String, dynamic> json) {
    return WidgetData(
      type: json['type'],
      data: json['data'],
    );
  }
}
