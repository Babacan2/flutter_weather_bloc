import 'package:equatable/equatable.dart';
import '../models/weather_model.dart';

// Tüm state sınıfları WeatherState'ten türetiliyor
abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

// Başlangıç durumu
class WeatherInitial extends WeatherState {}

// Veri yükleniyor
class WeatherLoading extends WeatherState {}

// Veri başarıyla yüklendi
class WeatherLoaded extends WeatherState {
  final Weather weather;
  const WeatherLoaded(this.weather);

  @override
  List<Object> get props => [weather];
}

// Hata durumu
class WeatherError extends WeatherState {
  final String message;
  const WeatherError(this.message);

  @override
  List<Object> get props => [message];
}
