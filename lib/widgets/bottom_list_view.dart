import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_forcast_daily.dart';
import 'package:weather_app/widgets/forecast_card.dart';

class BottomListView extends StatelessWidget {
  const BottomListView({super.key, required this.snapshot});
  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data!.list!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '7-Day Weather Forecast'.toUpperCase(),
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 140,
          padding: const EdgeInsets.all(16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 160,
              color: Colors.black87,
              child: ForecastCard(
                snapshot: snapshot,
                index: index,
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemCount: forecastList.length,
          ),
        ),
      ],
    );
  }
}
