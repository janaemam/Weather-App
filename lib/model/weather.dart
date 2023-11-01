import 'package:flutter/material.dart';
class Weather{
  double temp;
  String cityName;
  String mainCondition;
  // String weatherIcon;

  Weather(this.temp, this.cityName, this.mainCondition,);
  String getIcon(String main){
    String iconPath='/things/lottie/SunAndCloud';
    switch(main){
      case "Rain"||"Drizzle" :{
        iconPath="/things/lottie/Rain.json";
      }
      break;
      case "Thunderstorm":{
        iconPath="/things/lottie/Thunderstorm.json";
      }
      break;
      case "Snow":{
        iconPath="/things/lottie/Snow.json";
      }
      break;
      case "Mist"||"Smoke"||"Haze"||"Dust"||"Fog"||"Sand"||"Dust"||"Ash"||"Squall"||"Tornado":{
        iconPath="/things/lottie/Dust.json";
      }
      break;
      case "Clear":{
        iconPath="/things/lottie/Sunny.json";
      }
      break;
      case "Clouds":{
        iconPath="/things/lottie/Cloud.json";
      }
      break;

    }
    return iconPath;
  }
}