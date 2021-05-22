import 'package:assignment/constants/constants.dart';
import 'package:assignment/constants/default_colors.dart';
import 'package:flutter/material.dart';
import 'package:assignment/custom_shapes/custom_shape.dart';

class GetStarted extends StatefulWidget {
  GetStarted({Key? key, required this.name});
  final String name;

  @override
  GetStartedState createState() => GetStartedState();
}

class GetStartedState extends State<GetStarted> {
  static Widget buildCustomShape(screenWidth, screenHeight, func) {
    return CustomPaint(
      size: Size(screenWidth, screenHeight),
      painter: func,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(children: [
            Container(
              child: buildCustomShape(
                  width,
                  (width * 1.977777777777778).toDouble(),
                  GetStatredBackGround()),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, height * 0.19, 0, 0),
              child: Column(
                children: [
                  Container(
                    height: 140,
                    decoration: BoxDecoration(
                      color: DefaultColors.kWhite,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            offset: Offset(0, 4),
                            spreadRadius: 2,
                            color: DefaultColors.kGrey)
                      ],
                      image: DecorationImage(
                        //  colorFilter: ColorFilter.mode(Colors.purple, BlendMode.color),
                        image: AssetImage('assets/images/edit_profile.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text("Welcome",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: DefaultColors.kBlack,
                            fontSize: 20)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(widget.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: DefaultColors.kBlack,
                            fontSize: 30)),
                  ),
                  Container(
                          width: width,
                          padding:
                              EdgeInsets.fromLTRB(40, height * 0.1, 40, 0),
                          child: MaterialButton(
                            elevation: 5,
                            height: 40,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: DefaultColors.kBlue,
                            onPressed: () {
                            
                            },
                            child: Text(
                              "Lets Get Started",
                              style: TextStyle(
                                  fontSize: 18, color: DefaultColors.kWhite),
                            ),
                          ),
                        ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
