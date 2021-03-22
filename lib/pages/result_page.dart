import 'package:bmi/components/card.dart';
import 'package:bmi/components/constants.dart';
import 'package:bmi/components/themes.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String bmiDetail;

  ResultPage({@required this.bmiResult, @required this.bmiDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ReusableCard(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(
                            'Your BMI',
                            style: kResultPageBaseTextStyle,
                          ))),
                          Expanded(
                              flex: 3,
                              child: Center(
                                  child: Text(
                                bmiResult,
                                style: kBigTextStyle,
                              ))),
                          Expanded(
                              child: Center(
                                  child: Text(
                            bmiDetail,
                            style: kBMICategory,
                          ))),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                    flex: 2,
                    child: ReusableCard(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BMIDetail(
                              range: 'Less than 16',
                              detail: 'Severe Thinness',
                            ),
                            Divider(),
                            BMIDetail(
                              range: '16 to 17',
                              detail: 'Moderate Thinness',
                            ),
                            Divider(),
                            BMIDetail(
                              range: '17 to 18.5',
                              detail: 'Mild Thinness',
                            ),
                            Divider(),
                            BMIDetail(
                              range: '18.5 to 25',
                              detail: 'Normal',
                            ),
                            Divider(),
                            BMIDetail(
                              range: '25 to 30',
                              detail: 'Overweight',
                            ),
                            Divider(),
                            BMIDetail(
                              range: 'More than 30',
                              detail: 'Obese',
                            ),
                          ],
                        ),
                      ),
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 40.0,
                      horizontal: 50,
                    ),
                    child: ReusableCard(
                      color: accentColor,
                      child: Center(
                        child: Text(
                          'Re-Calculate'.toUpperCase(),
                          style: kSubjectTextStyle,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BMIDetail extends StatelessWidget {
  final String range;
  final String detail;

  BMIDetail({@required this.range, @required this.detail});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          range,
          style: kResultPageBaseTextStyle,
        ),
        Text(
          detail,
          style: kSubjectTextStyle,
        ),
      ],
    );
  }
}
