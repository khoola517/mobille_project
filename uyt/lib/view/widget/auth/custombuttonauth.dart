import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uyt/core/constant/color.dart';

class Custombuttonauth extends StatelessWidget {
  final String text ;
  //final String label;
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final void Function()? onPressed;

  const Custombuttonauth(
    {super.key, 
    required this.text, 
    this.onPressed,   
    required this.width, 
    required this.height, 
    required this.color, 
    required this.textColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: color,
        textColor: ColorApp.backgroundcolor,
        child: Text(text,style: TextStyle(fontSize: 16,fontFamily: "Flutter"),),
      
      ),
    );
  }
}