import 'package:flutter/material.dart';
import 'package:intro_rive/splash_screen.dart';

import 'animations.dart';

void main() => runApp(AppWidget());

class AppWidget extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter SVG Animações com Rive',
      home: SplashScreen(),
    );
  }
}