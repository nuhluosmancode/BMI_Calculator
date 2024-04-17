import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants.dart';
import 'package:flutter_application_6/components/reusable_card.dart';
import 'package:flutter_application_6/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {


ResultsPage({required this.bmiResults,required this.resultText,required this.interpretation});

final String bmiResults;
final String resultText;
final String interpretation;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment:CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
             alignment: Alignment.bottomLeft,
              child: const  Text(
                'Your Results',
                style: kTitleTextStyle,
              ),
            ),
          ),

          Expanded(
            flex: 5,
            child: ReusableCard(colour: kActiveCardColour,
             cardChild: 
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                Text(resultText.toUpperCase(),
                style: kResultTextStyle,

                ),
                Text(bmiResults,
                style: kBMITextStyle,
                ),
                Text(interpretation,
                textAlign: TextAlign.center,
                style: kBodyStyleStyle,
                )

              
            ],
            ),
            ),

          
          
          ),
          BottomButton(onTap: (){Navigator.pop(context);
          }, buttonTitle: 'RE-CALCULATE'),
        ],
      ),
    );
  }
}
