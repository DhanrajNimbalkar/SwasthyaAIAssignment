import 'package:assignment/screens/get_started.dart';
import 'package:assignment/screens/selection.dart';
import 'package:flutter/material.dart';
import 'package:assignment/constants/default_colors.dart';
import 'package:assignment/constants/constants.dart';
import 'package:assignment/custom_shapes/custom_shape.dart';
import 'package:assignment/widgets/selector_dialogs.dart';
import 'package:intl/intl.dart';

class CreateProfile extends StatefulWidget {
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  List<String> optionsAllergies = [
    "Cough",
    "Headache",
    "Breathlessness",
    "Sewating",
    "Fever",
    "Body Ache",
    "Chest Pain",
    "Heart Burn",
    "Nausea",
    "Dizziness",
    "Other"
  ];
  List<String> selectedAllergies = [], selectedComordities = [];
  List<String> optionComordities = [
    "Cough",
    "Headache",
    "Breathlessness",
    "Sewating",
    "Fever",
    "Body Ache",
    "Chest Pain",
    "Heart Burn",
    "Nausea",
    "Dizziness",
    "Other"
  ];
  String bloodGroupSelected = "", tempbloodGroup = "";
  String genderSeleted = "", tempGenderSelection = "";
  final List<String> genders = <String>["Male", "Female"];
  final List<String> bloodGroups = <String>["A+", "AB", "B+"];
  TextEditingController _bloodGroup = TextEditingController();
  TextEditingController _gender = TextEditingController();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _dateofBirth = TextEditingController();
  TextEditingController _pincode = TextEditingController();
  TextEditingController _emergencyContactNum = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    tempGenderSelection = "Male";
    tempbloodGroup = "AB";
    super.initState();
  }

  Widget selected(selectedList) {
    return Container(
      padding: EdgeInsets.only(bottom: 5),
      child: GridView.count(
          childAspectRatio: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          shrinkWrap: true,
          crossAxisCount: 2,
          children: List.generate(selectedList.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedList.remove(selectedList[index]);
                });
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                decoration: BoxDecoration(
                    border: Border.all(color: DefaultColors.kWhite),
                    borderRadius: BorderRadius.all(Radius.circular(22))),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        selectedList[index],
                        style: TextStyle(color: DefaultColors.kWhite),
                      ),
                    ),
                    Expanded(
                        child: Icon(
                      Icons.highlight_remove_sharp,
                      color: DefaultColors.kWhite,
                    ))
                  ],
                ),
              ),
            );
          })),
    );
  }

  Widget textFormField(controller, hintText, readOnly, onTap) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      cursorColor: DefaultColors.kWhite,
      style: TextStyle(color: DefaultColors.kWhite, fontSize: 18),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: DefaultColors.kWhite),
          border: UnderlineInputBorder(),
          focusColor: DefaultColors.kWhite,
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
      validator: (value) {
        if (hintText == "SELECT GENDER") {
          if (value == null || value.isEmpty) {
            return "Please select Gender";
          } else {
            return null;
          }
        } else {
          if (value == null || value.isEmpty)
            return "Please select Gender";
          else
            return null;
        }
      },
    );
  }

  Widget bloodGroupSelector() {
    return textFormField(
      _bloodGroup,
      'Blood Group',
      true,
      () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            title: Text(
              'BLOOD GROUP',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: DefaultColors.kBlue),
            ),
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Container(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  height: 130,
                  child: Scrollbar(
                    isAlwaysShown: true,
                    child: ListView.builder(
                      itemCount: bloodGroups.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tempbloodGroup = bloodGroups[index];
                                });
                              },
                              child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color:
                                          tempbloodGroup == bloodGroups[index]
                                              ? DefaultColors.kOrange
                                              : DefaultColors.kWhite,
                                      border: Border.all(
                                          color: DefaultColors.kWhite),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Center(
                                    child: Text(
                                      bloodGroups[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: tempbloodGroup ==
                                                  bloodGroups[index]
                                              ? DefaultColors.kWhite
                                              : DefaultColors.kBlack),
                                    ),
                                  )),
                            ),
                            SizedBox(height: 5)
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 30, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: TextButton(
                            child: Text("SELECT",
                                style: TextStyle(
                                    color: DefaultColors.kOrange,
                                    fontSize: 17)),
                            onPressed: () {
                              _bloodGroup.text = tempbloodGroup;
                              bloodGroupSelected = tempbloodGroup;
                              Navigator.pop(context);
                            },
                          )),
                      Expanded(child: Container(), flex: 1),
                      Expanded(
                          flex: 3,
                          child: TextButton(
                            child: Text("CANCEL",
                                style: TextStyle(
                                    color: DefaultColors.kBlack, fontSize: 17)),
                            onPressed: () {
                              tempbloodGroup = bloodGroupSelected;
                              Navigator.pop(context);
                            },
                          ))
                    ],
                  ),
                )
              ]));
            }),
          ),
        );
      },
    );
  }

  Widget genderSelector() {
    return textFormField(
      _gender,
      "Gender",
      true,
      () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            title: Text(
              'SELECT GENDER',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: DefaultColors.kBlue),
            ),
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Container(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                Container(
                  height: 90,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: genders.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                tempGenderSelection = genders[index];
                              });
                            },
                            child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: tempGenderSelection == genders[index]
                                        ? DefaultColors.kOrange
                                        : DefaultColors.kWhite,
                                    border:
                                        Border.all(color: DefaultColors.kWhite),
                                    borderRadius: BorderRadius.circular(25)),
                                child: Center(
                                  child: Text(
                                    genders[index],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: tempGenderSelection ==
                                                genders[index]
                                            ? DefaultColors.kWhite
                                            : DefaultColors.kBlack),
                                  ),
                                )),
                          ),
                          SizedBox(height: 5)
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 30, 20, 0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: TextButton(
                            child: Text("SELECT",
                                style: TextStyle(
                                    color: DefaultColors.kOrange,
                                    fontSize: 17)),
                            onPressed: () {
                              _gender.text = tempGenderSelection;
                              genderSeleted = tempGenderSelection;
                              Navigator.pop(context);
                            },
                          )),
                      Expanded(child: Container(), flex: 1),
                      Expanded(
                          flex: 3,
                          child: TextButton(
                            child: Text("CANCEL",
                                style: TextStyle(
                                    color: DefaultColors.kBlack, fontSize: 17)),
                            onPressed: () {
                              tempGenderSelection = genderSeleted;
                              Navigator.pop(context);
                            },
                          ))
                    ],
                  ),
                )
              ]));
            }),
          ),
        );
      },
    );
  }

  static Widget buildCustomShape(screenWidth, screenHeight, func) {
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
                child: buildCustomShape(
                    width,
                    (width * 1.777777777777778).toDouble(),
                    RightTopCustomShape()),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.6, top: height * 0.07),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(
                      // colorFilter: ,
                      image: AssetImage('assets/images/edit_profile.png'),
                      fit: BoxFit.contain,
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
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextFormField(
                                    controller: _firstName,
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
                                        //
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
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          !RegExp('[a-zA-Z]').hasMatch(value)) {
                                        return "Enter your First Name";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                Expanded(flex: 1, child: Container()),
                                Expanded(
                                  flex: 3,
                                  child: TextFormField(
                                    controller: _lastName,
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
                                    validator: (value) {
                                      if (value == null ||
                                          value.isEmpty ||
                                          !RegExp('[a-zA-Z]').hasMatch(value)) {
                                        return "Enter your Last Name";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.033,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextFormField(
                                    controller: _dateofBirth,
                                    readOnly: true,
                                    onTap: () async {
                                      debugPrint("Presse date picker");
                                      final DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: new DateTime.now(),
                                        firstDate: new DateTime(1940),
                                        lastDate: new DateTime.now(),
                                      );
                                      if (pickedDate != null)
                                        setState(() {
                                          _dateofBirth.text =
                                              DateFormat("yy/MM/dd")
                                                  .format(pickedDate);
                                        });
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Select BirthDate";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                Expanded(flex: 1, child: Container()),
                                Expanded(flex: 3, child: genderSelector())
                              ],
                            ),
                            SizedBox(
                              height: height * 0.033,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextFormField(
                                    controller: _pincode,
                                    keyboardType: TextInputType.number,
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
                                    validator: (value) {
                                      debugPrint("Over here$value");
                                      if (value == null || value.isEmpty) {
                                        return "Enter your First Name";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                                Expanded(child: Container(), flex: 4)
                              ],
                            ),
                            SizedBox(height: height * 0.03),
                            Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: TextFormField(
                                    keyboardType: TextInputType.phone,
                                    controller: _emergencyContactNum,
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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Contact number cann't be empty";
                                      } else if (!RegExp(
                                              r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                          .hasMatch(value)) {
                                        return "Invalid Contact number";
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.03),
                            Row(children: [
                              Expanded(flex: 3, child: bloodGroupSelector()),
                              Expanded(flex: 4, child: Container()),
                            ]),
                            SizedBox(height: height * 0.03),
                            Row(
                              children: [
                                Text(
                                  "Allergies",
                                  style: TextStyle(
                                      color: DefaultColors.kWhite,
                                      fontSize: 18),
                                ),
                                selectedAllergies.length == 0
                                    ? IconButton(
                                        onPressed: () async {
                                          FocusScopeNode currentFocus =
                                              FocusScope.of(context);
                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                          dynamic selectedallergies =
                                              await Navigator.of(context)
                                                  .pushReplacement(
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  SelectionOptionList(
                                                title: "Add Allergies",
                                                selectedList: selectedAllergies,
                                                selectionList: optionsAllergies,
                                              ),
                                            ),
                                          );
                                          setState(() {
                                            selectedAllergies =
                                                selectedallergies;
                                          });
                                        },
                                        color: DefaultColors.kWhite,
                                        icon: Icon(
                                            Icons.add_circle_outline_outlined))
                                    : Container()
                              ],
                            ),
                            SizedBox(height: height * 0.01),
                            selectedAllergies.length == 0
                                ? Container()
                                : Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                        color: DefaultColors.kWhite,
                                        // width: 2,
                                      )),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 4,
                                            child: selected(
                                              selectedAllergies,
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: IconButton(
                                              icon: Icon(Icons
                                                  .add_circle_outline_outlined),
                                              color: DefaultColors.kWhite,
                                              onPressed: () async {
                                                FocusScopeNode currentFocus =
                                                    FocusScope.of(context);
                                                if (!currentFocus
                                                    .hasPrimaryFocus) {
                                                  currentFocus.unfocus();
                                                }
                                                dynamic selectedallergies =
                                                    await Navigator.of(context)
                                                        .push(
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        SelectionOptionList(
                                                      title: "Add Allergies",
                                                      selectedList:
                                                          selectedAllergies,
                                                      selectionList:
                                                          optionsAllergies,
                                                    ),
                                                  ),
                                                );
                                                setState(() {
                                                  selectedAllergies =
                                                      selectedallergies;
                                                });
                                              },
                                            )),
                                      ],
                                    ),
                                  ),
                            selectedAllergies.length != 0
                                ? SizedBox(height: height * 0.03)
                                : Container(),
                            Row(
                              children: [
                                Text(
                                  "Comordities",
                                  style: TextStyle(
                                      color: DefaultColors.kWhite,
                                      fontSize: 18),
                                ),
                                selectedComordities.length == 0
                                    ? IconButton(
                                        onPressed: () async {
                                          FocusScopeNode currentFocus =
                                              FocusScope.of(context);
                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                          dynamic slectedcomorbidities =
                                              await Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  SelectionOptionList(
                                                      title:
                                                          "Add Comorbidities",
                                                      selectedList:
                                                          selectedComordities,
                                                      selectionList:
                                                          optionComordities),
                                            ),
                                          );
                                          setState(() {
                                            selectedComordities =
                                                slectedcomorbidities;
                                          });
                                        },
                                        color: DefaultColors.kWhite,
                                        icon: Icon(
                                            Icons.add_circle_outline_outlined))
                                    : Container()
                              ],
                            ),
                            SizedBox(height: 10),
                            selectedComordities.length > 0
                                ? Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                        color: DefaultColors.kWhite,
                                      )),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 4,
                                            child: selected(
                                              selectedComordities,
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: IconButton(
                                              icon: Icon(
                                                Icons
                                                    .add_circle_outline_outlined,
                                                color: DefaultColors.kWhite,
                                              ),
                                              onPressed: () async {
                                                FocusScopeNode currentFocus =
                                                    FocusScope.of(context);
                                                if (!currentFocus
                                                    .hasPrimaryFocus) {
                                                  currentFocus.unfocus();
                                                }
                                                dynamic slectedcomorbidities =
                                                    await Navigator.of(context)
                                                        .push(
                                                  MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        SelectionOptionList(
                                                            title:
                                                                "Add Comorbidities",
                                                            selectedList:
                                                                selectedComordities,
                                                            selectionList:
                                                                optionComordities),
                                                  ),
                                                );
                                                setState(() {
                                                  selectedComordities =
                                                      slectedcomorbidities;
                                                });
                                              },
                                            ))
                                      ],
                                    ),
                                  )
                                : Container()
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: buildCustomShape(
                              width,
                              (width * 0.3977777777777778).toDouble(),
                              BackgroundCustomShape()),
                        ),
                        Container(
                          width: width,
                          padding:
                              EdgeInsets.fromLTRB(40, height * 0.13, 40, 0),
                          child: MaterialButton(
                            elevation: 5,
                            height: 40,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: DefaultColors.kBlue,
                            onPressed: () {
                              debugPrint("Pressed button");
                              if (_formKey.currentState!.validate() != null) {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) => GetStarted(
                                      name: _firstName.text +
                                          " " +
                                          _lastName.text),
                                ));
                              }
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
