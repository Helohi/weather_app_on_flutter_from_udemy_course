import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/models/weather_forcast_daily.dart';
import 'package:weather_app/utilities/forecast_util.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.snapshot});
  final AsyncSnapshot<WeatherForecast> snapshot; // Must have data

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var pressure = forecastList![0].pressure! * 0.750062;
    var humidity = forecastList[0].humidity!;
    var wind = forecastList[0].speed!.toInt();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Util.getItem(
          FontAwesomeIcons.temperatureThreeQuarters,
          pressure.round(),
          'mm Hg',
        ),
        Util.getItem(
          FontAwesomeIcons.cloudRain,
          humidity,
          '%',
        ),
        Util.getItem(FontAwesomeIcons.wind, wind, 'm/s')
      ],
    );
  }
}
