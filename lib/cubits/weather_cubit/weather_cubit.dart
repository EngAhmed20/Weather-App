import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_comp/cubits/weather_state/weather_state.dart';
import 'package:weather_app_comp/models/weather_model.dart';
import 'package:weather_app_comp/services/Weather_Services.dart';

class weathercubit extends Cubit<weatherstate>
{
  weathercubit(this.weatherServices):super(weatherInitial());
  String? CityName;
  WeatherServices weatherServices;
  WeatherModel?weatherModel;
  void getweather({required cityName})async
  {
    emit(weatherLoading());
   try{
     weatherModel= await weatherServices.getWeather(cityName: cityName);
     emit(weatherSucess());
   }
   catch (e)
    {
      emit(weatherFailure());
    }

  }

}