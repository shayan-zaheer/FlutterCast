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
              children: [
                  SizedBox(
                  width: double.infinity,
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