import 'package:assignment/constants/constants.dart';
import 'package:assignment/constants/default_colors.dart';
import 'package:assignment/custom_shapes/custom_shape.dart';
import 'package:flutter/material.dart';

class SelectionOptionList extends StatefulWidget {
  SelectionOptionList(
      {Key? key,
      required this.title,
      required this.selectedList,
      required this.selectionList});
  final String title;
  final List<String> selectionList;
  final List<String> selectedList;
  @override
  _SelectionOptionListState createState() => _SelectionOptionListState();
}

class _SelectionOptionListState extends State<SelectionOptionList> {
  static Widget buildCustomShape(screenWidth, screenHeight, func) {
    return CustomPaint(
      size: Size(screenWidth, screenHeight),
      painter: func,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DefaultColors.kWhite,
      body: SafeArea(
          child: Container(
              child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: DefaultColors.kWhite,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                child: buildCustomShape(
                    width,
                    (width * 1.777777777777778).toDouble(),
                    RightTopCustomShape()),
              ),
            ),
            Positioned(
                child: IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_left_outlined,
                      size: 40,
                      color: DefaultColors.kWhite,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    })),
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.06, right: width * 0.3, top: height * 0.1),
              child: Text(
                widget.title,
                style: TextStyle(
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(30, height * 0.31, 30, 0),
              child: Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                elevation: 5,
                child: Container(
                  width: width,
                  height: 45,
                  child: TextField(
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(bottom: 0, left: 20, right: 10),
                          suffixIcon:
                              Icon(Icons.search, color: DefaultColors.kBlack),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: DefaultColors.kWhite),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: DefaultColors.kWhite),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: DefaultColors.kWhite),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          hintText: "Search",
                          hintStyle: TextStyle(
                              color: DefaultColors.kBlack, fontSize: 18),
                          filled: true,
                          fillColor: DefaultColors.kWhite)),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(30, height * 0.43, 30, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Please Choose Symptoms",
                      style:
                          TextStyle(fontSize: 20, color: DefaultColors.kBlack)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      color: DefaultColors.kWhite,
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                          childAspectRatio: 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          crossAxisCount: 2,
                          children: List.generate(widget.selectionList.length,
                              (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  widget.selectedList
                                          .contains(widget.selectionList[index])
                                      ? widget.selectedList
                                          .remove(widget.selectionList[index])
                                      : widget.selectedList
                                          .add(widget.selectionList[index]);
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                                decoration: BoxDecoration(
                                    color: widget.selectedList.contains(
                                            widget.selectionList[index])
                                        ? DefaultColors.kBlue
                                        : DefaultColors.kWhite,
                                    border: Border.all(
                                        color: widget.selectedList.contains(
                                                widget.selectionList[index])
                                            ? DefaultColors.kBlue
                                            : DefaultColors.kBlack),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(22))),
                                child: Row(
                                  children: [
                                    Expanded(
                                      // flex: 3,
                                      child: Text(
                                        widget.selectionList[index],
                                        style: TextStyle(
                                            color: widget.selectedList.contains(
                                                    widget.selectionList[index])
                                                ? DefaultColors.kWhite
                                                : DefaultColors.kBlack),
                                      ),
                                    ),
                                    Expanded(
                                        // flex: 1,
                                        child: widget.selectedList.contains(
                                                widget.selectionList[index])
                                            ? Icon(
                                                Icons.highlight_remove_sharp,
                                                color: DefaultColors.kWhite,
                                              )
                                            : Icon(
                                                Icons
                                                    .add_circle_outline_outlined,
                                                color: DefaultColors.kBlack,
                                              ))
                                  ],
                                ),
                              ),
                            );
                          }))),
                  SizedBox(height: 10),
                  Container(
                    width: width,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,horizontal: 70
                    ),
                    child: MaterialButton(
                      elevation: 5,
                      height: 40,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      color: DefaultColors.kOrange,
                      onPressed: () {
                      Navigator.pop(context, widget.selectedList);
                      },
                      child: Text(
                        "Add",
                        style: TextStyle(
                            fontSize: 18, color: DefaultColors.kWhite),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ))),
    );
  }
}
