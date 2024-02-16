import 'dart:convert';
import 'package:http/http.dart' as http;

class ComprarService {
  static Future<List<dynamic>?> getFormasFromApi() async {
    try {
      final url =
          Uri.parse('https://testedefensoriapr.pythonanywhere.com/precos');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return jsonData;
      }
    } catch (error) {
      print('error : $error');
    }
    return null;
  }
}
