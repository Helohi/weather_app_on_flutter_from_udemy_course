import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forcast_daily.dart';
import 'package:weather_app/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  const CityView({super.key, required this.snapshot});
  final AsyncSnapshot<WeatherForecast> snapshot; // Must have data

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list;
    var city = snapshot.data!.city!.name;
    var country = snapshot.data!.city!.country;
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList![0].dt! * 1000);
    return Column(
      children: [
        Text(
          '$city, $country',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            color: Colors.white70,
          ),
        ),
        Text(
          Util.getFormattedDate(formattedDate),
          style: const TextStyle(fontSize: 15),
        )
      ],
    );
  }
}
