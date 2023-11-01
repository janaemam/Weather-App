import 'package:flutter/material.dart';
class IconService{


    String getIcon(String? main) {
      String iconPath='things/lottie/SunAndCloud.json';
      switch(main){
        case "Rain"||"Drizzle" :{
          iconPath="things/lottie/Rain.json";
        }
        break;
        case "Thunderstorm":{
          iconPath="things/lottie/Thunderstorm.json";
        }
        break;
        case "Snow":{
          iconPath="things/lottie/Snow.json";
        }
        break;
        case "Mist"||"Smoke"||"Haze"||"Dust"||"Fog"||"Sand"||"Dust"||"Ash"||"Squall"||"Tornado":{
          iconPath="things/lottie/Dust.json";
        }
        break;
        case "Clear":{
          iconPath="things/lottie/Sunny.json";
        }
        break;
        case "Clouds":{
          iconPath="things/lottie/Cloud.json";
        }
        break;
      }
      return iconPath;
}
}