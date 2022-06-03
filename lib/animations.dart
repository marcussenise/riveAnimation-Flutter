import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class Animations extends StatefulWidget {
  Animations({Key? key}) : super(key: key);

  @override
  State<Animations> createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> {
  late RiveAnimationController _upButtonController;
  late RiveAnimationController _downButtonController;
  late RiveAnimationController _flutuandoController;
  late RiveAnimationController _caindoController;
  bool isFlying = false;
  bool isFalling = false;


  void _changeAnimation(RiveAnimationController controller){
    if(controller.isActive == false){
      controller.isActive = true;
    }
  }


  @override 
  void initState() {
    super.initState();
    _upButtonController = OneShotAnimation('Press', autoplay: false);
    _downButtonController = OneShotAnimation('Animation 1', autoplay: false);
    _caindoController = SimpleAnimation('Animation 1', autoplay: true);
    _flutuandoController = SimpleAnimation('Untitled 1', autoplay: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(129, 52, 165, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(isFlying == false && isFalling == false)...[
            Container(
            height: 270,
            width: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/bowie.jpg',
                )
              ),
              shape: BoxShape.circle,
            ),
            )
          ] else if (isFlying == true && isFalling == false)...[
            ClipRRect (
              borderRadius: BorderRadius.circular(20),
              child: 
                Container(
                    height: 270,
                    width: 300,
                    child: RiveAnimation.asset(
                      'assets/floating.riv',
                      fit: BoxFit.cover,
                      controllers: [_flutuandoController],
                    ),
                    
                  ),
          )] else if(isFlying == false && isFalling == true)...[
            ClipRRect (
              borderRadius: BorderRadius.circular(20),
              child:
                SizedBox(
                  height: 270,
                  width: 300,
                  child: 
                         RiveAnimation.asset(
                      'assets/falling.riv',
                      fit: BoxFit.cover,
                      controllers: [_caindoController],
                    ),
                )
            ),
          ], 
          const SizedBox(
            height: 60,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTapDown: (_){
                  setState(() {
                    isFlying = true;
                    isFalling = false;
                  });
                  _changeAnimation(_upButtonController);
                  _changeAnimation(_flutuandoController);
                },
                child: SizedBox(
                  height: 115,
                  width: 115,
                  child: RiveAnimation.asset('assets/button.riv',
                  controllers: [
                    _upButtonController
                  ],),  
                ),
              ),
              GestureDetector(
                onTapDown: (_){
                  setState(() {
                    isFlying = false;
                    isFalling = true;
                  });
                  _changeAnimation(_downButtonController);
                  _changeAnimation(_caindoController);
                },
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: RiveAnimation.asset('assets/error.riv',
                  controllers: [
                    _downButtonController
                  ],),  
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}