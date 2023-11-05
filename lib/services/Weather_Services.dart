import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app_comp/models/weather_model.dart';

class WeatherServices {
  Future<WeatherModel?> getWeather({required String cityName}) async {
    WeatherModel? weather;
    try{
      String baseurl = 'http://api.weatherapi.com/v1';
      String apikey = '3677bed892474b30b7a122242220806';
      Uri url = Uri.parse('$baseurl/forecast.json?key=$apikey&q=$cityName&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
         weather =WeatherModel.fromJson(data);


      //  WeatherModel weather =WeatherModel.fromJson(data);
    }
    catch(e){
      print(e);
    }
    return weather;
  }
}
