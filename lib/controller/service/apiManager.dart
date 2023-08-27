import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_api/controller/service/endPoint.dart';
import 'package:weather_api/model/weather_model.dart';
import 'package:weather_api/view/credendials/snackBar.dart';

class ApiManager {
 static getWeather(context)async{
   try {
      var url =Uri.parse(URL.endPoint);
   var response= await http.get(url);
   var res = jsonDecode(response.body);
   print(response.body);
  
  return WeatherModel.fromJson(res);
   } catch (e) {
     snackBar(context, e.toString());
   }

  }
}