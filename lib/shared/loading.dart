import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget{
  @override
  //builds loading widget
  Widget build(BuildContext context){
    return Container(
      //makes the color of the loading animation
      color: Colors.deepPurple[100],
      child: const Center(
        //uses the SpinKit Wave loading animation
        child:SpinKitWave(
          color: Colors.amber,
          size:50.0,
        )
      )
    );
  }
}