import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}
class _LoadingState extends State<Loading>
{
 @override
 void initState(){
   super.initState();
   Timer(
     const Duration( seconds: 2),()=> Navigator.popAndPushNamed(context, '/location')
   );
 }




  @override
  Widget build (BuildContext context){
    return const Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          size: 50,
          color: Colors.grey,
        ),
      ),
    );
  }


}