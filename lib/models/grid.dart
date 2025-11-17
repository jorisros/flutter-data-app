class Grid {
  final String id;
  final String name;

  Grid({required this.id, required this.name});

  factory Grid.fromJson(Map<String, dynamic> json) {
    return Grid(
      id: json['id'],
      name: json['name'],
    );
  }
}
