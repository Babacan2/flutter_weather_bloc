import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_state.dart';
import 'package:weather_app/repo/weather_repository.dart';

class MainPageCubit extends Cubit<WeatherState>{
  MainPageCubit():super(WeatherInitial());

  var wrepo = WeatherRepository();

  Future<void> getWeather(String city) async {
    try {
      emit(WeatherLoading());
      final weather = await wrepo.fetchWeather(city);
      emit(WeatherLoaded(weather));
    } catch (e) {
      emit(WeatherError('Hava durumu alınamadı'));
    }
  }
}