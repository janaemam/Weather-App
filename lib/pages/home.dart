import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/services/weatherService.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather/theme/themeProvider.dart';
import 'package:weather/theme/theme.dart';
import 'dart:convert';
class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => DisplayWeather();

}

class DisplayWeather extends State<HomePage>{

    WeatherService weatherService =WeatherService();
    Weather? weather;


  get bgColor => Colors.black;
  bool flag = true;
  get txtColor => Colors.grey;


   getTemp(BuildContext context) async{
     final cityName = ModalRoute.of(context)?.settings.arguments;
     final temp =await weatherService.getWeather(cityName.toString());

     print("cityName   ${temp}");
     print(cityName);
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

     });
     if(flag==true){
       setState(() {
           weather =temp;
         });
       flag = false;
     }
     //

   }

   @override
  void initState() {
    super.initState();
    //getTemp(context);
   }

  @override
  Widget build(BuildContext context)  {
     getTemp(context);
    // final cityName = ModalRoute.of(context)!.settings.arguments;
    // City city = City.getCity('cairo');
    //  String weather = await WeatherService.getWeather(city).toString();


    SystemUiOverlayStyle(
        statusBarColor: Colors.red,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Theme.of(context).colorScheme.background,
        systemNavigationBarIconBrightness: Brightness.dark  );

    return  Scaffold(
        body: SafeArea(
          child: Stack(
           // mainAxisAlignment: MainAxisAlignment.start,
            children:[
                Switch(value:  context.read<ThemeProvider>().themeData == darkMode, onChanged: (bool value){

                  Provider.of<ThemeProvider>(context, listen: false).switchTheme();
                },
                  activeColor: Theme.of(context).colorScheme.secondary,


                  activeTrackColor: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                ),
              location(),
            ]

          ),
        ),
      )

    ;
  }


  AppBar appBar(){
    return AppBar(

    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: bgColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: bgColor,
        systemNavigationBarIconBrightness: Brightness.light  )

    );
  }
  Widget location(){

    final cityName = ModalRoute.of(context)!.settings.arguments;

     return Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Column(
               children: [
                 GestureDetector(
                   onTap: (){
                     Navigator.pop(context, '/location');
                   },
                   child: SvgPicture.asset('things/icons/location.svg', height: 20,colorFilter:
                    ColorFilter.mode( Theme.of(context).colorScheme.primary, BlendMode.srcIn),),
                 ),

                  Text(cityName.toString(), style:   TextStyle(
                 fontSize: 25,
                 fontFamily: 'Poppins',
                 color: Theme.of(context).colorScheme.primary,
                 ),),
               ],
             ),
           ],
         ),
                  Lottie.asset('things/lottie/SunAndCloud.json'),

          Text('${weather?.temp}°', style: TextStyle(
           fontFamily: 'Poppins',
           fontSize: 35,
           color: Theme.of(context).colorScheme.primary,
           fontWeight: FontWeight.w600
         ),),
       ],
     );

  }



}
