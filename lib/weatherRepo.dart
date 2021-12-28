import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Weather_Model.dart';

class WeatherRepo {
  var api = '8dc72e210cbc35c4a6c468c60e0acc95#';
  var result;
  var results;
  Future<WeatherModel> getWeather(String city) async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$api');
    final result = await http.get(url);
    if (result.statusCode == 200) {
      results = WeatherModel.fromJson(jsonDecode(result.body));
    } else {
      print('Error in API');
    }
    return results;
  }
}
