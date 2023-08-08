import 'package:flutter/material.dart';
import 'package:week2/weather/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Future<dynamic>? weatherResp;
  final myController = TextEditingController();
  String city = "Kathmandu";

  @override
  void initState() {
    weatherResp = WeatherService.getWeather(city);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: TextField(
            decoration: const InputDecoration(hintText: "Search..."),
            controller: myController,
            onChanged: (data) {
              setState(() {
                data = data.trim() == '' ? "Kathmandu" : data;
                weatherResp = WeatherService.getWeather(data);
              });
            },
          ),
        ),
        body: Center(
            child: Column(
          children: [
            FutureBuilder<dynamic>(
                future: weatherResp,
                builder: (BuildContext context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data == "not found") {
                      return const Flexible(
                        child: Center(
                          child: Text(
                            "The weather data for entered city cannot be found.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      );
                    }
                    return Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data!.name.toString(),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${snapshot.data!.weather![0].main.toString()}, ${snapshot.data!.weather![0].description.toString()}",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    snapshot.data!.main!.temp.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 60,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Feels like: ${snapshot.data!.main!.feelsLike.toString()}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                    ),
                                  ),
                                  const Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            "Wind",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.wind!.speed
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            "Rain",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.visibility!
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            "Clouds",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.clouds!.all
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ])
                          ],
                        ),
                      ),
                    );
                  }
                  return const Flexible(
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        Text("Loading....")
                      ],
                    )),
                  );
                }),
          ],
        )),
      ),
    );
  }
}
