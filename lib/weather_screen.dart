import "dart:convert";
import "dart:ui";
import "package:flutter/material.dart";
import "package:fluttercast/additional_item.dart";
import "package:fluttercast/hourly_forecast_item.dart";
import "package:http/http.dart" as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:intl/intl.dart";

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weather;

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      final res = await http.get(
        Uri.parse(
            "https://api.openweathermap.org/data/2.5/forecast?q=London,uk&APPID=3b9da385440737138b8911309cd83186"),
      );

      final data = jsonDecode(res.body);
      if (data["cod"] != "200") {
        throw data["message"];
      }

      return data;
    } catch (err) {
      throw err.toString();
    }
  }

  @override
  void initState(){
    super.initState();
    weather = getCurrentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather App",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState((){
                weather = getCurrentWeather();
              });
            },
            icon: Icon(Icons.refresh),
          ), // iconbutton gives padding by itself
        ],
      ),
      body: FutureBuilder(
        future: weather,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          final data = snapshot.data!;
          final currentInfo = data["list"][0];
          final currentList = data["list"];

          final currentTemp = currentInfo["main"]["temp"];
          final currentSky = currentInfo["weather"][0]["main"];

          final currentPressure = currentInfo["main"]["pressure"];
          final currentWind = currentInfo["wind"]["speed"];
          final currentHumidity = currentInfo["main"]["humidity"];

          return Padding(
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
                                  "$currentTemp K",
                                  style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Icon(Icons.cloud, size: 64),
                                Text(
                                  currentSky,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
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
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   child: Row(
                //     children: currentList.map<Widget>((li) {
                //       String temperature = li["main"]["temp"].toString();
                //       String time = li["dt_txt"].split(" ")[1].toString();
                //       return HourlyForecastItem(time: time, icon: Icon(Icons.sunny), temperature: temperature);
                //     }).toList(),
                //   ),
                // ),

                SizedBox(
                  height: 120,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final hourlyForecast = data["list"][index + 1];
                      String hourlySky = hourlyForecast["weather"][0]["main"].toString();
                      String hourlyTemp = hourlyForecast["main"]["temp"].toString();
                      final time = DateTime.parse(hourlyForecast["dt_txt"]);
                      return HourlyForecastItem(
                          time: DateFormat.Hm().format(time),
                          icon: hourlySky == "Clouds" || hourlySky == "Rain" ? Icon(Icons.cloud) : Icon(Icons.sunny),
                          temperature: hourlyTemp);
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),

                SizedBox(height: 20),
                Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditionalItem(
                      myIcon: Icon(Icons.water_drop),
                      type: "Humidity",
                      val: "$currentHumidity",
                    ),
                    AdditionalItem(
                      myIcon: Icon(Icons.speed),
                      type: "Wind Speed",
                      val: "$currentWind",
                    ),
                    AdditionalItem(
                      myIcon: Icon(Icons.umbrella),
                      type: "Pressure",
                      val: "$currentPressure",
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
