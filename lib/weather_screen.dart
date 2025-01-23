import "dart:ui";
import "package:flutter/material.dart";

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
                "Weather App",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                )
            ),
            centerTitle: true,
            actions: [
                IconButton(
                    onPressed:() {
                      debugPrint("real");
                    },
                    icon: Icon(Icons.refresh),
                ), // iconbutton gives padding by itself
            ]
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  SizedBox(
                  width: double.infinity, // if you only want to add width, use sizedbox. otherwise if you want all properties, you use container
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
                                      Icon(
                                          Icons.cloud,
                                          size: 64
                                      ),
                                      Text(
                                          "Rain",
                                          style: TextStyle(
                                              fontSize: 20,
                                          )
                                      )
                                  ],
                              ),
                            ),
                          ),
                        )
                    ),
                  ),
                  SizedBox(
                      height: 20
                  ),
                  Text(
                    "Weather Forecast",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                    )
                ),
                SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                  child: Row(
                      children: [
                          Card(
                              elevation: 6,
                              child: Container(
                                width: 90,
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    children: [
                                        Text(
                                          "09:00",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      Icon(
                                          Icons.cloud,
                                          size: 32
                                      ),
                                      Text(
                                          "320.12"
                                      )
                                    ],
                                ),
                              )
                          ),
                          Card(
                              elevation: 6,
                              child: Container(
                                width: 90,
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    children: [
                                        Text(
                                          "09:00",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      Icon(
                                          Icons.cloud,
                                          size: 32
                                      ),
                                      Text(
                                          "320.12"
                                      )
                                    ],
                                ),
                              )
                          ),
                          Card(
                              elevation: 6,
                              child: Container(
                                width: 90,
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    children: [
                                        Text(
                                          "09:00",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      Icon(
                                          Icons.cloud,
                                          size: 32
                                      ),
                                      Text(
                                          "320.12"
                                      )
                                    ],
                                ),
                              )
                          ),
                          Card(
                              elevation: 6,
                              child: Container(
                                width: 90,
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    children: [
                                        Text(
                                          "09:00",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      Icon(
                                          Icons.cloud,
                                          size: 32
                                      ),
                                      Text(
                                          "320.12"
                                      )
                                    ],
                                ),
                              )
                          ),
                          Card(
                              elevation: 6,
                              child: Container(
                                width: 90,
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    children: [
                                        Text(
                                          "09:00",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      Icon(
                                          Icons.cloud,
                                          size: 32
                                      ),
                                      Text(
                                          "320.12"
                                      )
                                    ],
                                ),
                              )
                          ),
                          Card(
                              elevation: 6,
                              child: Container(
                                width: 90,
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    children: [
                                        Text(
                                          "09:00",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      Icon(
                                          Icons.cloud,
                                          size: 32
                                      ),
                                      Text(
                                          "320.12"
                                      )
                                    ],
                                ),
                              )
                          ),
                          Card(
                              elevation: 6,
                              child: Container(
                                width: 90,
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                    children: [
                                        Text(
                                          "09:00",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      Icon(
                                          Icons.cloud,
                                          size: 32
                                      ),
                                      Text(
                                          "320.12"
                                      )
                                    ],
                                ),
                              )
                          ),
                          Card(
                              elevation: 6,
                              child: Container(
                                width: 90,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                ),
                                child: Column(
                                    children: [
                                        Text(
                                          "09:00",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      Icon(
                                          Icons.cloud,
                                          size: 32
                                      ),
                                      Text(
                                          "320.12"
                                      )
                                    ],
                                ),
                              )
                          )
                      ],
                  ),
                ),
                  Placeholder(
                      fallbackHeight: 150,
                  ),
                  SizedBox(
                      height: 20
                  ),
                  Placeholder(
                      fallbackHeight: 150,
                  ),
          
              ],
          ),
        )
    );
  }
}