import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  
const ReusableCard({super.key, required this.colour,required this.cardChild});

final  Color colour;
final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
     
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: colour,
      ),
       child: cardChild,
    );
  }
}