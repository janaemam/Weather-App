import 'package:weather/model/city.dart';
import 'package:flutter/material.dart';

class Location extends StatelessWidget{
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: appBar(),
    body: cityList()


  );
  }

  AppBar appBar(){
   return AppBar(
     centerTitle: true,
     elevation: 0,
     backgroundColor: Colors.grey,
     title: const Text('Weather',
     style: TextStyle(
       fontFamily: 'Poppins',
       fontSize: 30,
       letterSpacing: 5
     ),),

   );

  }
  Widget cityList(){
    List <City> cities = City.getCities();
    return ListView.separated(
      itemCount: cities.length,
        separatorBuilder: (context, index)=> const SizedBox(height: 5),
        itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: (){
                  final String city = cities[index].name;
                  Navigator.pushNamed(context, '/home',arguments: city);
                },
                child: Text('${cities[index].name}, ${cities[index].country}',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 25,

                ),),
              ),
            ],
          ),
        );
        }
    );

  }
  
}