import 'package:flutter/material.dart';
import 'package:xtrip_mobile/widgets/circle_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
          child:  CircleWidget(
        width: 240,
        height: 240,
        color: Color.fromRGBO(190, 190, 190, 1),
        margin: 10,
        child:  CircleWidget(
          color:  Color.fromRGBO(204, 204, 204, 1),
          width: 220,
          height: 220,
          margin: 10,
          child:  CircleWidget(
            width: 200,
            height: 200,
            color:  Color.fromRGBO(219, 219, 219, 1),
            margin: 10,
            child: CircleWidget(
              width: 180,
              height: 180,
              color: Color.fromRGBO(247, 247, 247, 1),
              margin: 10,
              child:  CircleWidget(
                  width: 152,
                  height: 152,
                  color:  Color.fromRGBO(255, 255, 255, 1),
                  margin: 14),
            ),
          ),
        ),
      )),
    );
  }
}
