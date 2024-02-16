import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpController {
  Future<Map<String, dynamic>> httpGet(url) async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erro ao carregar dados da API!');
    }
  }
}
