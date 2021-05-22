import 'package:flutter/material.dart';
import 'package:task/constants/default_colors.dart';

class GenderSelector extends StatefulWidget {
  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String genderSeleted, tempGenderSelection;
  final List<String> genders = <String>["Male", "Female"];

  TextEditingController _gender = TextEditingController();

   @override
  void initState() {
    // TODO: implement initState
    tempGenderSelection = "Male";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _gender,
      readOnly: true,
      onTap: () {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            title: Text(
              'Select Gender',
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
      cursorColor: DefaultColors.kWhite,
      style: TextStyle(color: DefaultColors.kWhite, fontSize: 18),
      decoration: const InputDecoration(
          hintText: 'Gender',
          hintStyle: TextStyle(color: DefaultColors.kWhite),
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
    );
  }
}

class BloodGroupSelector extends StatefulWidget {
  @override
  _BloodGroupSelectorState createState() => _BloodGroupSelectorState();
}

class _BloodGroupSelectorState extends State<BloodGroupSelector> {
  String bloodGroupSelected, tempbloodGroup;
  final List<String> bloodGroups = <String>["A+", "AB", "B+"];
  TextEditingController _bloodGroup = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    tempbloodGroup = "AB";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // onSaved: (),
      controller: _bloodGroup,
      readOnly: true,
      onTap: () {
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
                      // physics: const NeverScrollableScrollPhysics(),
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
      cursorColor: DefaultColors.kWhite,
      style: TextStyle(color: DefaultColors.kWhite, fontSize: 18),
      decoration: const InputDecoration(
          hintText: 'Blood Group',
          hintStyle: TextStyle(color: DefaultColors.kWhite),
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
    );
  }
}
