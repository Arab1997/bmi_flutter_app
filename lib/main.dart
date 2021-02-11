import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app_test/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_app_test/result_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: InputPage(),
    );
  }
}

enum Gender { male, female }

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender gender;
  var age = 20;
  var height = 150;
  var weight = 0;

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
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  onTap: () {
                    setState(() {
                      gender = Gender.male;
                    });
                  },
                  color: gender == Gender.male
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.mars,
                          size: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "MALE",
                          style: kBodyTextStyle,
                        )
                      ]),
                )),
                Expanded(
                    child: ReusableCard(
                  onTap: () {
                    setState(() {
                      gender = Gender.female;
                    });
                  },
                  color: gender == Gender.female
                      ? kActiveCardColour
                      : kInactiveCardColour,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.venus,
                          size: 100,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "FEMALE",
                          style: kBodyTextStyle,
                        )
                      ]),
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "HEIGHT",
                        style: kBodyTextStyle,
                      ),
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Slider(
                          min: 130,
                          max: 220,
                          activeColor: kBottomContainerCardColour,
                          value: height.toDouble(),
                          onChanged: (value) {
                            setState(() {
                              height = value.round();
                            });
                          })
                    ],
                  ),
                )),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "WEIGHT",
                          style: kBodyTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus),
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                width: 50.0,
                                height: 50.0,
                              ),
                              elevation: 5,
                              fillColor: Color(0xFF222747),
                              padding: EdgeInsets.all(5),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus),
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                width: 50.0,
                                height: 50.0,
                              ),
                              elevation: 5,
                              fillColor: Color(0xFF222747),
                              padding: EdgeInsets.all(5),
                            ),
                          ],
                        ),
                      ]),
                )),
                Expanded(
                    child: ReusableCard(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "AGE",
                          style: kBodyTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(FontAwesomeIcons.plus),
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                width: 50.0,
                                height: 50.0,
                              ),
                              elevation: 5,
                              fillColor: Color(0xFF222747),
                              padding: EdgeInsets.all(5),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RawMaterialButton(
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(FontAwesomeIcons.minus),
                              shape: CircleBorder(),
                              constraints: BoxConstraints.tightFor(
                                width: 50.0,
                                height: 50.0,
                              ),
                              elevation: 5,
                              fillColor: Color(0xFF222747),
                              padding: EdgeInsets.all(5),
                            ),
                          ],
                        ),
                      ]),
                )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              final  heightSquared = height / 100;
              final  res = weight / (heightSquared*heightSquared);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultPage(
                          bmi: res.round().toString(),
                        )),
              );
            },
            child: Container(
              height: 70,
              color: kBottomContainerCardColour,
              child: Center(
                  child: Text(
                'CALCULATE MY BMI',
                style: kLargeButtonTextStyle,
              )),
            ),
          )
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;

  final Widget child;
  final Function onTap;

  ReusableCard({
    Key key,
    this.color = kInactiveCardColour,
    this.child,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: child,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
