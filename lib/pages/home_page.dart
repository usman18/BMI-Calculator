import 'package:bmi_cal/components/controller_row.dart';
import 'package:bmi_cal/utilities/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../utilities/constants.dart';
import '../components/custom_card.dart';
import 'bmi_result.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Gender _selectedGender = Gender.Male;

  int age = 21;
  int weight = 60;
  int height = 175;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('BMI CALCULATOR', style: kAppBarTextStyle),
      ),
      body: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: CustomCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Age',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$age',
                            style: kLargeTextStyle,
                          ),
                          ValueController(onPlusPressed: () {
                            setState(() {
                              age++;
                            });
                          }, onMinusPressed: () {
                            setState(() {
                              age--;
                            });
                          }),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Weight',
                            style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '$weight',
                            style: kLargeTextStyle,
                          ),
                          ValueController(
                            onPlusPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            onMinusPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Height',
                      style: kLabelTextStyle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$height',
                      style: kLargeTextStyle,
                    ),
                    Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        activeColor: Theme.of(context).accentColor,
                        inactiveColor: Colors.grey[400],
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  ],
                ),
              ),
            ),
            Expanded(
              child: CustomCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Gender',
                      style: kLabelTextStyle,
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "I'm",
                          style: kLargeTextStyle,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            GestureDetector(
                              child: Icon(
                                FontAwesomeIcons.mars,
                                color: _selectedGender == Gender.Male
                                    ? Colors.blue
                                    : Colors.grey[400],
                                size: 40,
                              ),
                              onTap: () {
                                _updateGender(Gender.Male);
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              child: Icon(
                                FontAwesomeIcons.venus,
                                color: _selectedGender == Gender.Female
                                    ? Colors.pink
                                    : Colors.grey[400],
                                size: 40,
                              ),
                              onTap: () {
                                _updateGender(Gender.Female);
                              },
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: FloatingActionButton(
                onPressed: () {
                  BMI calculator = BMI(height: height, weight: weight);

                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return ResultPage(
                      bmi: calculator.calculateBMI(),
                      status: calculator.getResult(),
                    );
                  }));
                },
                child: Icon(FontAwesomeIcons.calculator),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _updateGender(Gender gender) {
    print(gender.toString());
    setState(() {
      _selectedGender = gender;
    });
  }
}
