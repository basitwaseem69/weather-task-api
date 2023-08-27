import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api/controller/provider/getProvider.dart';
import 'package:weather_api/view/wheatherScreen.dart';

void main() {
  runApp(My());
}

class My extends StatelessWidget {
  const My({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) =>WeatherProvider() ,),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: "roboto",
        ),
        home: WeatherScreen(),
      ),
    );
  }
}
