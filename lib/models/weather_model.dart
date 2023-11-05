// accept data in oop
import 'package:flutter/material.dart';

class WeatherModel {
  String? date;
  double? temp;
  double? maxtemp;
  double? mintemp;
  String? weatherStatwName;

  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherStatwName});
  //بناء المودل باستحدام بيانات من ع النت بصيغة جيسون
  factory WeatherModel.fromJson(dynamic data) {
    var json = data['forecast']['forecastday'][0]['day'];

    return WeatherModel(
        date: data['location']['localtime'],
        temp: json['avgtemp_c'],
        maxtemp: json['maxtemp_c'],
        mintemp: json['mintemp_c'],
        weatherStatwName: json['condition']['text']);
  }
  @override
  String toString() {

    return 'date $date temp= $temp max =$maxtemp  min=$mintemp state= $weatherStatwName';
  }


  String getimage()
  {
    if(weatherStatwName == 'Clear' || weatherStatwName =='Light Cloud')
      return 'assets/images/clear.png';
    else if(weatherStatwName == 'Sleet' || weatherStatwName =='Snow' || weatherStatwName =='Hail')
      return 'assets/images/snow.png';
    else if(weatherStatwName == 'Heavy Cloud'||weatherStatwName =='Patchy rain possible' )
      return 'assets/images/cloudy.png';
    else if(weatherStatwName == 'Light Rain' || weatherStatwName =='Showers' || weatherStatwName =='Heavy Rain')
      return 'assets/images/rainy.png';
    else if(weatherStatwName == 'Thunder' ||weatherStatwName == 'Thunderstorm' )
      return 'assets/images/thunderstorm.png';
    else
      return 'assets/images/clear.png';






  }

  MaterialColor getcolor()
  {
    if(weatherStatwName == 'Clear' || weatherStatwName =='Light Cloud')
      return Colors.amber;
    else if(weatherStatwName == 'Sleet' || weatherStatwName =='Snow' || weatherStatwName =='Hail')
      return Colors.green;
    else if(weatherStatwName == 'Heavy Cloud'||weatherStatwName =='Patchy rain possible' )
      return Colors.blueGrey;
    else if(weatherStatwName == 'Light Rain' || weatherStatwName =='Showers' || weatherStatwName =='Heavy Rain')
      return Colors.teal;
    else if(weatherStatwName == 'Thunder' ||weatherStatwName == 'Thunderstorm' )
      return Colors.orange;
    else
      return Colors.blue;






  }

}



