import 'package:flutter/material.dart';
import 'package:flutter_application_6/screen/results_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_application_6/components/icon_content.dart';
import 'package:flutter_application_6/components/reusable_card.dart';
import 'package:flutter_application_6/constants.dart';
import 'package:flutter_application_6/components/bottom_button.dart';
import 'package:flutter_application_6/components/round_icon_button.dart';
import 'package:flutter_application_6/calculate_brain.dart';

enum Gender {
  male,
  female,
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;

  int height = 180;
  int weight = 60;
  int age = 20;
//1=male, 1=female
  void updateColour(Gender selectedgender) {
    //male card pressed
    if (selectedgender == Gender.male) {
      if (maleCardColour == kInactiveCardColour) {
        maleCardColour = kActiveCardColour;
        femaleCardColour = kInactiveCardColour;
      } else {
        maleCardColour = kInactiveCardColour;
      }
    }

//female card pressed
    if (selectedgender == Gender.female) {
      if (femaleCardColour == kInactiveCardColour) {
        femaleCardColour = kActiveCardColour;
        maleCardColour = kInactiveCardColour;
      } else {
        femaleCardColour = kInactiveCardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.male);
                        print('clicked');
                      });
                    },
                    child: ReusableCard(
                        colour: maleCardColour,
                        cardChild: const IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        )),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        updateColour(Gender.female);
                      });
                    },
                    child: ReusableCard(
                      colour: femaleCardColour,
                      cardChild: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: kTextStyleLabel,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kSecondContainer),
                        const Text(
                          'cm',
                          style: kTextStyleLabel,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: const Color(0XFFEB1555),
                        activeTrackColor: Colors.white,
                        overlayColor: const Color(0X29EB1555),
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15.0),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        inactiveColor: const Color(0XFF8D8E98),
                        onChanged: (double newValue) {
                          print(newValue);
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: kTextStyleLabel,
                          ),
                          Text(
                            weight.toString(),
                            style: kSecondContainer,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      colour: kActiveCardColour,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Age',
                            style: kTextStyleLabel,
                          ),
                          Text(
                            age.toString(),
                            style: kSecondContainer,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              const SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'Calculate',
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(

                      bmiResults: calc.calculateBMI(),
                      resultText: calc.getResults(),
                      interpretation: calc.getInterpretetion(), 
                      
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

