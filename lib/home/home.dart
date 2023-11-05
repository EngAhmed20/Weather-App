

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_comp/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app_comp/cubits/weather_state/weather_state.dart';
import 'package:weather_app_comp/models/weather_model.dart';
import 'package:weather_app_comp/providers/weather_provider.dart';
import 'package:weather_app_comp/search/search.dart';



class HomePage extends StatelessWidget {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor:Provider.of<weatherprovider>(context).weatherdata==null?Colors.blue :Colors.orange[300] ,
        title: Text('Weather App'),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return searchpage();
            }));
          }, icon: Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder <weathercubit,weatherstate>(builder: (context,state) {
        if (state is weatherLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (state is weatherSucess) {
          weatherData =BlocProvider.of<weathercubit>(context).weatherModel;
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    weatherData!.getcolor(),
                    weatherData!.getcolor()[50]!,
                    weatherData!.getcolor()[100]!,
                    weatherData!.getcolor()[200]!,

                  ],
                )
            ),


            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(
                  flex: 3,
                ),
                Text(BlocProvider.of<weathercubit>(context).CityName!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                Text('Updated: ${weatherData!.date}',
                  style: TextStyle(fontSize: 20),),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(weatherData!.getimage()),
                    Text('${weatherData!.temp?.toInt()}', style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),),
                    Column(
                      children: [
                        Text('MaxTemp : ${weatherData!.maxtemp!.toInt()}'),
                        Text('MinTemp : ${weatherData!.mintemp!.toInt()}'),

                      ],
                    ),

                  ],
                ),
                Spacer(),
                Text('${weatherData!.weatherStatwName}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                Spacer(
                  flex: 3,
                ),


              ],
            ),
          );
        }
        else if (state is weatherFailure) {
          return Center(
            child: Text(('Something went wrong please try again')),
          );
        }
        else {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'there is no weather 😔 start',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  'searching now 🔍',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),

              ],
            ),

          );
        }
      }
    )





    );
  }
}

/*true?
      ):Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              weatherData!.getcolor(),
              weatherData!.getcolor()[50]!,
              weatherData!.getcolor()[100]!,
              weatherData!.getcolor()[200]!,

            ],
          )
        ),


        child:Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 3,
            ),
            Text('${Provider.of<weatherprovider>(context).cityName!}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            Text('Updated: ${weatherData!.date}',style: TextStyle(fontSize: 20),),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(weatherData!.getimage()),
                Text('${weatherData!.temp?.toInt()}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                Column(
                  children: [
                    Text('MaxTemp : ${weatherData!.maxtemp!.toInt()}'),
                    Text('MinTemp : ${weatherData!.mintemp!.toInt()}'),

                  ],
                ),

              ],
            ),
            Spacer(),
            Text('${weatherData!.weatherStatwName}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            Spacer(
              flex: 3,
            ),



          ],
        ),
      ) ,*/