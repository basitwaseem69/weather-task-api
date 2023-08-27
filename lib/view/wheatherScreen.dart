import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api/controller/provider/getProvider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    var api = context.read<WeatherProvider>();
    api.getWeather(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Color(0xffD9CCFE),
      body: Builder(builder: (context) {
        var bloc = context.watch<WeatherProvider>();
        return bloc.isLoading
            ? Center(child: CircularProgressIndicator())
            : Container(
                padding: EdgeInsets.all(20),
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "images/wea.jpg",
                      ),
                      fit: BoxFit.cover),
                ),
                //  main columnn koo wrap kiya container maiii
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${bloc.weather!.sys!.country}".toUpperCase(),
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 1columnn,,,
                        Column(
                          children: [
                            Text(
                              "${(bloc.weather!.main!.temp! - 273).toInt()}",
                              style: TextStyle(
                                  fontSize: 200,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        // 2 columnnn
                        Column(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(15),
                      // height: 80,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // 1columnn
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${bloc.weather!.main!.humidity}%",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Humidity",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          // 2 colum
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${bloc.weather!.main!.pressure}Km",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "pressure",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          //3 columnn..
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${bloc.weather!.clouds!.all}%",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Clouds",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
