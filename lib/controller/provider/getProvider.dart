import 'package:flutter/material.dart';
import 'package:weather_api/controller/service/apiManager.dart';

import '../../model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  bool isLoading = false;
  WeatherModel? weather;
  getWeather(context) async {
    isLoading = true;
    notifyListeners();
    weather = await ApiManager.getWeather(context);
    isLoading = false;
    notifyListeners();

  }
}
