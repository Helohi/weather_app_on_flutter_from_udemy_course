import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_forcast_daily.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/utilities/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast({String? cityName}) async {
    late final Map<String, String> params;

    if (cityName == null) {
      Location location = Location();
      await location.getCurrentLocation();

      var queryParamets = {
        'APPID': Constants.weatherAppId,
        'units': 'metric',
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
      };
      params = queryParamets;
    } else {
      var queryParamets = {
        'APPID': Constants.weatherAppId,
        'units': 'metric',
        'q': cityName,
      };
      params = queryParamets;
    }

    var uri = Uri.https(
      Constants.weatherBaseUrlDomain,
      Constants.weatherForecastPath,
      params,
    );
    final resp = await Dio().getUri(uri);
    if (resp.statusCode == 200) {
      return WeatherForecast.fromJson(resp.data);
    } else {
      return Future.error('Error Response');
    }
  }
}
