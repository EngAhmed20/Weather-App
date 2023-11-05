
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_comp/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app_comp/models/weather_model.dart';
import 'package:weather_app_comp/providers/weather_provider.dart';
import 'package:weather_app_comp/services/Weather_Services.dart';

class searchpage extends StatelessWidget {
String? cityName;
//VoidCallback? updateui;

//searchpage({this.updateui});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body:Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (data)async
            {
              cityName=data;
             BlocProvider.of<weathercubit>(context).getweather(cityName: cityName);
              BlocProvider.of<weathercubit>(context).CityName = cityName;

              Navigator.pop(context);


            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 35,horizontal: 25),
              labelText: 'Enter a City',
              border:OutlineInputBorder(),
              suffixIcon: Icon(Icons.search)
            ),
          ),
        ),
      ) ,
    );
  }
}



