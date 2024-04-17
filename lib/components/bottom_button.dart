import 'package:flutter/material.dart';
import 'package:flutter_application_6/constants.dart';


class BottomButton extends StatelessWidget {

  const BottomButton({required this.onTap,required this.buttonTitle});
  
  final VoidCallback onTap;
  final String buttonTitle;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: 
          Container(
            color: kBottomContainerColor,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kBottomContainerHeight,
            child:  Center(
              child:  Text(buttonTitle,
              style: kLargeButtonTextStyle,),
            )
          
      ),
    );
  }
}
