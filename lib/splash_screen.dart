import 'package:flutter/material.dart';
import 'package:intro_rive/animations.dart';
import 'package:rive/rive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(
      Duration(seconds: 5), () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Animations(),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(129, 52, 165, 1),
      body: Center(
        child: Container(
          width: 400,
          child: RiveAnimation.asset('assets/spaceman.riv',),
        ),
      ),
      
    );
  }
}