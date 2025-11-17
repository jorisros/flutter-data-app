import 'dart:convert';
import 'package:http/http.dart' as http;

class GridService {
  Future<List<dynamic>> getGridData(String gridId) async {
    // Replace this with your actual backend endpoint
    final url = Uri.parse('http://localhost:3000/grids/$gridId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load grid data');
    }
  }
}
