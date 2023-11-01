import 'package:weather/model/city.dart';
import 'package:flutter/material.dart';
import 'package:weather/theme/themeProvider.dart';
import 'package:weather/theme/theme.dart';

class Location extends StatelessWidget{
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: appBar(context),
    body: cityList(context)
  );
  }

  AppBar appBar(context){
   return AppBar(
     centerTitle: true,
     elevation: 0,
     backgroundColor:Theme.of(context).colorScheme.background,
     title:  Text('Weather',
     style: TextStyle(
       fontFamily: 'Poppins',
       fontSize: 20,
       color: Theme.of(context).colorScheme.primary,
       letterSpacing: 5
     ),),

   );

  }
  Container cityList(context){

    List <City> cities = City.getCities();
    return Container(
    color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: ListView.separated(
        itemCount: cities.length,
          separatorBuilder: (context, index)=> const SizedBox(height: 5),
          itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: GestureDetector(
              onTap: (){
                final String city = cities[index].name;
                Navigator.pushNamed(context, '/home',arguments: city);
              },
              child: Text('${cities[index].name}, ${cities[index].country}',
              style:  TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                color: Theme.of(context).colorScheme.primary

              ),),
            ),
          );
          }
      ),
    );

  }
  
}