import "dart:ui";
import "package:flutter/material.dart";
import "package:fluttercast/additional_item.dart";
import "package:fluttercast/hourly_forecast_item.dart";
import "package:http/http.dart" as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {

    @override
    void initState(){
        super.initState();
        getCurrentWeather();
    }

  Future getCurrentWeather() async{
    final res = await http.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=${dotenv.env['APP_ID']}"
        )
    );
    print("${dotenv.env['APP_ID']}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              debugPrint("real");
            },
            icon: Icon(Icons.refresh),
          ), // iconbutton gives padding by itself
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double
                  .infinity, // if you only want to add width, use sizedbox. otherwise if you want all properties, you use container
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Text(
                              "300 F",
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.cloud, size: 64),
                            Text("Rain",
                                style: TextStyle(
                                  fontSize: 20,
                                ))
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
            SizedBox(height: 20),
            Text(
              "Weather Forecast",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text("Additional Information",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                )),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalItem(
                  myIcon: Icon(Icons.water_drop),
                  type: "Humidity",
                  val: "84",
                ),
                AdditionalItem(
                  myIcon: Icon(Icons.speed),
                  type: "Wind Speed",
                  val: "7.67",
                ),
                AdditionalItem(
                  myIcon: Icon(Icons.umbrella),
                  type: "Pressure",
                  val: "1006",
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
