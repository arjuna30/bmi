import 'package:bmi/calculator_brain.dart';
import 'package:bmi/components/card.dart';
import 'package:bmi/components/constants.dart';
import 'package:bmi/components/themes.dart';
import 'package:bmi/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi/components/button.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double height = 170;
  int weight = 70;
  int age = 25;
  Color maleCardColor = inactiveColor;
  Color femaleCardColor = inactiveColor;
  Gender gender;

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Missing Gender'),
          content: SingleChildScrollView(
            child: Text('Gender haven\'t chosen yet.'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'OK',
                style: TextStyle(color: accentColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'BMI CALCULATOR',
                  style: kTitleTextStyle,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: ReusableCard(
                              color: gender == Gender.male
                                  ? accentColor
                                  : inactiveColor,
                              child: Center(
                                child: Text(
                                  'Male'.toUpperCase(),
                                  style: kSubjectTextStyle,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  gender = Gender.male;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: ReusableCard(
                              color: gender == Gender.female
                                  ? accentColor
                                  : inactiveColor,
                              child: Center(
                                child: Text(
                                  'Female'.toUpperCase(),
                                  style: kSubjectTextStyle,
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  gender = Gender.female;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 9,
                child: Row(
                  children: [
                    Expanded(
                      child: ReusableCard(
                        child: Column(
                          children: [
                            Expanded(
                                child: Center(
                                    child: Text('Height'.toUpperCase(),
                                        style: kSubjectTextStyle))),
                            Expanded(
                              flex: 13,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 10.0),
                                child: FlutterSlider(
                                  onDragging: (handle, currentValue, b) {
                                    height = currentValue;
                                    setState(() {});
                                  },
                                  values: [height],
                                  min: 120,
                                  max: 220,
                                  axis: Axis.vertical,
                                  rtl: true,
                                  trackBar: FlutterSliderTrackBar(
                                    activeTrackBar:
                                        BoxDecoration(color: accentColor),
                                  ),
                                  hatchMark: FlutterSliderHatchMark(
                                    density: 0.5,
                                    displayLines: true,
                                    bigLine: FlutterSliderSizedBox(
                                        height: 10,
                                        width: 2,
                                        decoration:
                                            BoxDecoration(color: accentColor)),
                                    smallLine: FlutterSliderSizedBox(
                                        height: 5,
                                        width: 1,
                                        decoration:
                                            BoxDecoration(color: accentColor)),
                                    linesAlignment:
                                        FlutterSliderHatchMarkAlignment.right,
                                    linesDistanceFromTrackBar: 5,
                                    labelsDistanceFromTrackBar: 85,
                                    labels: [
                                      FlutterSliderHatchMarkLabel(
                                          percent: 0, label: Text('Start')),
                                      FlutterSliderHatchMarkLabel(
                                          percent: 10, label: Text('130')),
                                      FlutterSliderHatchMarkLabel(
                                          percent: 30, label: Text('150')),
                                      FlutterSliderHatchMarkLabel(
                                          percent: 50, label: Text('170')),
                                      FlutterSliderHatchMarkLabel(
                                          percent: 70, label: Text('190')),
                                      FlutterSliderHatchMarkLabel(
                                          percent: 90, label: Text('210')),
                                      FlutterSliderHatchMarkLabel(
                                          percent: 100, label: Text('220')),
                                    ],
                                  ),
                                  tooltip: FlutterSliderTooltip(
                                      boxStyle: FlutterSliderTooltipBox(
                                          decoration: BoxDecoration(
                                              color: accentColor)),
                                      format: (String height) {
                                        return height + ' cm';
                                      },
                                      textStyle: TextStyle(
                                          fontSize: 26, color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            child: ReusableCard(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Weight'.toUpperCase(),
                                        style: kSubjectTextStyle),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(
                                          weight.toString(),
                                          style: kBigTextStyle,
                                        ),
                                        Text(
                                          ' kg',
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Button(
                                          child: Icon(FontAwesomeIcons.minus),
                                          onPressed: () {
                                            setState(() {
                                              weight--;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        Button(
                                          child: Icon(FontAwesomeIcons.plus),
                                          onPressed: () {
                                            setState(() {
                                              weight++;
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ReusableCard(
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text('Age'.toUpperCase(),
                                        style: kSubjectTextStyle),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      textBaseline: TextBaseline.alphabetic,
                                      children: [
                                        Text(
                                          age.toString(),
                                          style: kBigTextStyle,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Button(
                                          child: Icon(FontAwesomeIcons.minus),
                                          onPressed: () {
                                            setState(() {
                                              age--;
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          width: 15.0,
                                        ),
                                        Button(
                                          child: Icon(FontAwesomeIcons.plus),
                                          onPressed: () {
                                            setState(() {
                                              age++;
                                            });
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ReusableCard(
                  color: accentColor,
                  child: Center(
                      child: Text('CALCULATE', style: kSubjectTextStyle)),
                  onTap: () {
                    if (gender != null) {
                      BMICalculator calculate =
                          BMICalculator(height: height, weight: weight);
                      String bmiResult = calculate.getResult();
                      String bmiDetail = calculate.bmiDetail();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResultPage(
                                    bmiResult: bmiResult,
                                    bmiDetail: bmiDetail,
                                  )));
                    } else {
                      _showMyDialog();
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
