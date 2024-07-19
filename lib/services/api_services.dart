import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spacexdata/models/launch.dart';

class ApiService {
  final String _baseUrl = 'https://api.spacexdata.com/v3';

  Future<List<Launch>> fetchLaunches() async {
    final response = await http.get(Uri.parse('$_baseUrl/launches'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((launch) => Launch.fromJson(launch)).toList();
    } else {
      throw Exception('Failed to load launches');
    }
  }
}
