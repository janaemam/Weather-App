import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/model/weather.dart';
import 'package:weather/services/iconService.dart';
import 'package:weather/services/weatherService.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather/theme/themeProvider.dart';
import 'package:weather/theme/theme.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => DisplayWeather();

}

class DisplayWeather extends State<HomePage>{

    WeatherService weatherService =WeatherService();
    IconService iconService = IconService();
    Weather? weather;
    String? iconPath;
    bool flag = true;

    @override
    void initState() {
      super.initState();
    }


   getTemp(BuildContext context) async{
     final cityName = ModalRoute.of(context)?.settings.arguments;
     final temp =await weatherService.getWeather(cityName.toString());
     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
     if(flag==true){
       setState(() {
           weather =temp;
         });
       flag = false;
     }
     //
   }
   



  @override
  Widget build(BuildContext context)  {
     getTemp(context);
     String iconPath =iconService.getIcon(weather?.mainCondition);

    return  Scaffold(
        body: SafeArea(
          child: Stack(
            children:[
                location(iconPath),
              Switch(value:  context.read<ThemeProvider>().themeData == darkMode, onChanged: (bool value){

                  Provider.of<ThemeProvider>(context, listen: false).switchTheme();
                },
                  activeColor: Theme.of(context).colorScheme.secondary,
                  activeTrackColor: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                ),
            ]
          ),
        ),
      );
  }



  Widget location(iconPath){
    final cityName = ModalRoute.of(context)!.settings.arguments;

     return Container(
       color: Theme.of(context).colorScheme.background,
       padding: const EdgeInsets.all(8.0),
       child: Column(
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

                   Text('${weather?.mainCondition}', style: TextStyle(
                       fontFamily: 'Poppins',
                       fontSize: 20,
                       color: Theme.of(context).colorScheme.primary,

                   ),)
                 ],
               ),
             ],
           ),
                    Lottie.asset(iconPath),

            Text('${weather?.temp}°', style: TextStyle(
             fontFamily: 'Poppins',
             fontSize: 35,
             color: Theme.of(context).colorScheme.primary,
             fontWeight: FontWeight.w600
           ),),

         ],
       ),
     );

  }

}
