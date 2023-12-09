import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forcast_daily.dart';
import 'package:weather_app/utilities/forecast_util.dart';

class ForecastCard extends StatelessWidget {
  const ForecastCard({
    super.key,
    required this.snapshot,
    required this.index,
  });

  final AsyncSnapshot<WeatherForecast> snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list!;
    DateTime date =
        DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt! * 1000);
    var fulldate = Util.getFormattedDate(date);
    var dayOfTheWeek = fulldate.split(',')[0];

    var tempMin = forecastList[index].temp!.min!.toStringAsFixed(0);
    var icon = forecastList[index].getIconUrl();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              dayOfTheWeek,
              style: const TextStyle(fontSize: 15, color: Colors.white70),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                '$tempMin °C',
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white70,
                ),
              ),
            ),
            Image.network(icon, scale: 1.2),
          ],
        ),
      ],
    );
  }
}
