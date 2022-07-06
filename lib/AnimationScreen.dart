import 'dart:developer';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({Key? key}) : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  // double boxheight = 100;
  // double boxweight = 100;
  // var boxColor = Colors.deepOrange.shade200;
  // _updateState() {
  //   log('inside updatestate');
  //   setState(() {
  //     boxheight = 300;
  //     boxweight = 300;
  //     boxColor = Colors.purple;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Container transform '),
        ),
        body: const Center(
          // child:  Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Container(
          //       margin: const EdgeInsets.only(bottom: 40),
          //       child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(
          //           primary: Colors.white60, // background
          //           onPrimary: Colors.grey.shade700, // foreground
          //         ),
          //           onPressed: () {
          //             _updateState();
          //           },
          //           child: const Text('Click Me')),
          //     ),
          //     AnimatedContainer(
          //       duration: const Duration(seconds: 1),
          //       curve: Curves.bounceOut,
          //       height: boxheight,
          //       width: boxweight,
          //       color: boxColor,
          //     ),
          //   ],
          // ),

          // using animation package...
          child: Text('This is home screen...'),
        ),
        floatingActionButton: OpenContainer(
          transitionType: ContainerTransitionType.fade,
          transitionDuration: const Duration(seconds: 1),
          closedElevation: 5,
          closedColor: Colors.blue,
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          closedBuilder: (closedBuilder, openWidget) {
            return FloatingActionButton(
              onPressed: openWidget,
              child: const Icon(Icons.add),
            );
          },
          openBuilder: (context, closeWidget) {
            return const DestinationScreen();
          },
          openColor: Colors.blue,
          // closedShape: ,
        ),
      ),
    );
  }
}

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({Key? key}) : super(key: key);

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(' Fade animation '),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => customeDialog(context),
                child: const Text('Show Dialog')),
          ],
        )),
      ),
    );
  }

  Future customeDialog(BuildContext context) => showModal(
      configuration: const FadeScaleTransitionConfiguration(
        transitionDuration: Duration(seconds: 2),
      ),
      context: context,
      builder: (context) => AlertDialog(
            content: const Text('Animated Dialog'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'))
            ],
          ));
}
