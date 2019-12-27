import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BlinkAnimation extends StatelessWidget {
  const BlinkAnimation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Container(
          child: BlinkingTextAnimation(),
        ),
      ),
    );
  }
}

class BlinkingTextAnimation extends StatefulWidget {
  @override
  _BlinkingAnimationState createState() => _BlinkingAnimationState();
}

class _BlinkingAnimationState extends State<BlinkingTextAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    // final CurvedAnimation curve =
    //     CurvedAnimation(parent: controller, curve: Curves.ease);

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(controller);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return Opacity(
            opacity: animation.value,
            child: new Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
            ),
          );
        });
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
