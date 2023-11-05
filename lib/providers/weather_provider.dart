
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_comp/models/weather_model.dart';

class weatherprovider extends ChangeNotifier{
  WeatherModel? _weatherdata;
String? cityName;
  WeatherModel? get weatherdata => _weatherdata;

  set weatherdata(WeatherModel? value) {
    _weatherdata = value;
    notifyListeners();


  }
}

