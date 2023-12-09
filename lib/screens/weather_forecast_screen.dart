import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather_forcast_daily.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/widgets/bottom_list_view.dart';
import 'package:weather_app/widgets/city_view.dart';
import 'package:weather_app/widgets/detail_view.dart';
import 'package:weather_app/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key, required this.locationWeather});

  final WeatherForecast locationWeather;

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast>? forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();

    forecastObject = Future.value(widget.locationWeather);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        title: const Text('openweathermap.org'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
          icon: const Icon(Icons.my_location),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              String? tappedName = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CityScreen(),
                ),
              );

              if (tappedName != null) {
                _cityName = tappedName;
                setState(() {
                  forecastObject =
                      WeatherApi().fetchWeatherForecast(cityName: _cityName);
                });
              }
            },
            icon: const Icon(Icons.location_city),
          ),
        ],
      ),
      body: ListView(
        children: [
          FutureBuilder<WeatherForecast>(
            future: forecastObject,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    const SizedBox(height: 50),
                    CityView(snapshot: snapshot),
                    const SizedBox(height: 50),
                    TempView(snapshot: snapshot),
                    const SizedBox(height: 50),
                    DetailView(snapshot: snapshot),
                    const SizedBox(height: 50),
                    BottomListView(snapshot: snapshot),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return const Center(
                  child: SpinKitSpinningLines(
                    color: Colors.black87,
                    size: 50.0,
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
