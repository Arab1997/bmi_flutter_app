import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmi});

  final String bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBG,
      appBar: AppBar(
        backgroundColor: kBG,
        title: Text(
          "BMI CALCULATOR",
          style: kBodyTextStyle,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(height: 10,),
            Column(
              children: [
                Text(
                  "YOUR BMI IS",
                  style: kResultTextStyle,
                ),
                SizedBox(height: 30,),
                Text(
                  bmi,
                  style: kBMITextStyle,
                ),
              ],
            ),
            Align(
              alignment:Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
              Navigator.pop(context);
                },
                child: Container(
                  height: 70,
                  color: kBottomContainerCardColour,
                  child: Center(
                      child: Text(
                        'RECALCULATE MY BMI',
                        style: kLargeButtonTextStyle,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
