import 'package:flutter/material.dart';
import 'package:weather/pages/location.dart';
import 'package:weather/pages/home.dart';
import 'package:weather/pages/loading.dart';
import 'package:weather/theme/themeProvider.dart';

import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create:(context) =>ThemeProvider(),
        child: const MyApp(),
    )
    );

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<ThemeProvider>(context).themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
         '/': (context) => Loading(),
         '/home': (context)=> HomePage(),
        '/location':(context)=> const Location(),
      },
    );
  }
}
