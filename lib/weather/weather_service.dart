// https://home.openweathermap.org/api_keys
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:week2/weather/weather_model.dart';

// class WeatherService {
//   static Future<dynamic> getWeather() async {
//     final response = await http.get(Uri.parse(
//         "https://api.openweathermap.org/data/2.5/weather?q=pokhara&appid=280053af900290a6b62b966a4cdf4aa1"));
//     print(response.statusCode);

//     if (response.statusCode == 200) {
//       var newResponse = WeatherClass.fromJson(json.decode(response.body));
//       print(newResponse.main!.pressure.toString());
//       return newResponse;
//     }
//   }
// }

class WeatherService {
  static Future<dynamic> getWeather(city) async {
    String newCity = city == '' ? "Kathmandu" : city;
    final response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$newCity&appid=280053af900290a6b62b966a4cdf4aa1"));
    if (response.statusCode == 200) {
      var newResponse = WeatherClass.fromJson(json.decode(response.body));
      return newResponse;
    } else if (response.statusCode == 404) {
      var resp = "not found";
      return resp;
    }
  }
}
