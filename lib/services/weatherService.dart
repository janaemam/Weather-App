import 'package:flutter/material.dart';
import 'package:weather/model/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class WeatherService{

  static const baseUrl = 'https://api.openweathermap.org/data/2.5/weather';
  final String key = '';



    Future<Weather> getWeather(String cityName) async{
    var url = Uri.parse('$baseUrl?q=$cityName&appid=$key&units=metric');
    print("data____________________________ }");
    final response= await http.get(url);
    print("data____________________________ }");
    if (response.statusCode==200){
      Map data =jsonDecode(response.body);
      print("data____________________________ ${data}");
      return   Weather(data['main']["temp"],cityName,data['weather'][0]['main']);
    }
    else{
      throw Exception('Failed to get weather data');
    }

  }

}
