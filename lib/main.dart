

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_comp/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app_comp/home/home.dart';
import 'package:weather_app_comp/models/weather_model.dart';
import 'package:weather_app_comp/providers/weather_provider.dart';
import 'package:weather_app_comp/services/Weather_Services.dart';

void main() {
  runApp(BlocProvider(
      create: (context){
        return weathercubit(WeatherServices());},
      child: WeatherApp()));
}
class WeatherApp extends StatelessWidget {
  WeatherApp({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context)  {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:BlocProvider.of<weathercubit>(context).weatherModel==null? Colors.blue :BlocProvider.of<weathercubit>(context).weatherModel!.getcolor(),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

//