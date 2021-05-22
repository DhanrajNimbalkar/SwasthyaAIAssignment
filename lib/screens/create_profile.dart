import 'package:flutter/material.dart';
import 'package:task/constants/default_colors.dart';
import 'package:task/constants/constants.dart';
import 'package:task/custom_shapes/custom_shape.dart';
import 'package:task/widgets/selector_dialogs.dart';

class CreateProfile extends StatefulWidget {
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {

  List<String> selectedAllergies;
  List<String> selectedComordities;

  static Widget buildCustomShape(screenWidth,screenHeight, func) {
    return CustomPaint(
      size: Size(screenWidth, screenHeight),
      painter: func,
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
             
              Container(
                height: height * 0.165 * 2,
                color: DefaultColors.kBlue,
              ),
              Container(
                child: buildCustomShape(width,(width * 1.777777777777778).toDouble(), RightTopCustomShape()),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.6, top: height * 0.07),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage('assets/images/edit_profile.png'),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.06, right: width * 0.3, top: height * 0.07),
                child: Text(
                  "Tell us about yourself.",
                  style: TextStyle(
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
               Container(
                padding: EdgeInsets.only(top: height * 0.164 * 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                      color: DefaultColors.kBlue,
                      width: width,
                      child: Form(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextFormField(
                                    cursorColor: DefaultColors.kWhite,
                                    style: TextStyle(
                                        color: DefaultColors.kWhite,
                                        fontSize: 18),
                                    decoration: const InputDecoration(
                                        hintText: 'First Name',
                                        hintStyle: TextStyle(
                                            color: DefaultColors.kWhite),
                                        border: UnderlineInputBorder(), 
                                        focusColor: DefaultColors.kWhite,
                                        errorBorder: UnderlineInputBorder(),
                                        enabledBorder: UnderlineInputBorder(  
                                          borderSide: BorderSide(
                                            color: DefaultColors.kWhite,
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: DefaultColors.kWhite,
                                          ),
                                        )),
                                  ),
                                ),
                                Expanded(flex: 1, child: Container()),
                                Expanded(
                                  flex: 3,
                                  child: TextFormField(
                                    cursorColor: DefaultColors.kWhite,
                                    style: TextStyle(
                                        color: DefaultColors.kWhite,
                                        fontSize: 18),
                                    decoration: const InputDecoration(
                                        hintText: 'Last Name',
                                        hintStyle: TextStyle(
                                            color: DefaultColors.kWhite),
                                        border: UnderlineInputBorder(),
                                        focusColor: DefaultColors.kWhite,
                                        errorBorder: UnderlineInputBorder(),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: DefaultColors.kWhite,
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: DefaultColors.kWhite,
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextFormField(
                                    readOnly: true,
                                    onTap: () {
                                      debugPrint("Presse date picker");
                                      showDatePicker(
                                        context: context,
                                        initialDate: new DateTime.now(),
                                        firstDate: new DateTime.now().subtract(
                                            new Duration(days: 25000)),
                                        lastDate: new DateTime.now(),
                                      );
                                    },
                                    cursorColor: DefaultColors.kWhite,
                                    style: TextStyle(
                                        color: DefaultColors.kWhite,
                                        fontSize: 18),
                                    decoration: const InputDecoration(
                                        hintText: 'Date of Birth',
                                        hintStyle: TextStyle(
                                            color: DefaultColors.kWhite),
                                        border: UnderlineInputBorder(),
                                        focusColor: DefaultColors.kWhite,
                                        errorBorder: UnderlineInputBorder(),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: DefaultColors.kWhite,
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: DefaultColors.kWhite,
                                          ),
                                        )),
                                  ),
                                ),
                                Expanded(flex: 1, child: Container()),
                                Expanded(flex: 3, child: GenderSelector())
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextFormField(
                                    cursorColor: DefaultColors.kWhite,
                                    style: TextStyle(
                                        color: DefaultColors.kWhite,
                                        fontSize: 18),
                                    decoration: const InputDecoration(
                                        hintText: 'Pincode',
                                        hintStyle: TextStyle(
                                            color: DefaultColors.kWhite),
                                        border: UnderlineInputBorder(),
                                        focusColor: DefaultColors.kWhite,
                                        errorBorder: UnderlineInputBorder(),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: DefaultColors.kWhite,
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: DefaultColors.kWhite,
                                          ),
                                        )),
                                  ),
                                ),
                                Expanded(child: Container(), flex: 4)
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: TextFormField(
                                    cursorColor: DefaultColors.kWhite,
                                    style: TextStyle(
                                        color: DefaultColors.kWhite,
                                        fontSize: 18),
                                    decoration: const InputDecoration(
                                        hintText: 'Emergency Contact Number',
                                        hintStyle: TextStyle(
                                            color: DefaultColors.kWhite),
                                        border: UnderlineInputBorder(),
                                        focusColor: DefaultColors.kWhite,
                                        errorBorder: UnderlineInputBorder(),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: DefaultColors.kWhite,
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: DefaultColors.kWhite,
                                          ),
                                        )),
                                  ),
                                ),
                              ],
                            ),
                           
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                          child: buildCustomShape(width, (width * 0.3977777777777778).toDouble(), BackgroundCustomShape()),
                        ),
                        Container(
                          // margin: margin,
                          decoration: BoxDecoration(
                              ),
                          width: width,
                          padding:
                              EdgeInsets.fromLTRB(40, height * 0.13, 40, 0),
                          child: MaterialButton(
                            height:40,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: DefaultColors.kBlue,
                            onPressed: () {
                              debugPrint("Pressed button");
                            },
                            child: Text(
                              "Create Profile",
                              style: TextStyle(
                                  fontSize: 18, color: DefaultColors.kWhite),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
