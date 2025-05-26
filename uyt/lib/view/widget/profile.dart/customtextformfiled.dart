import 'package:flutter/material.dart';
import 'package:uyt/core/constant/color.dart';

class Customtextformfiled extends StatelessWidget {
  final String hinttext ;
  final IconData icon;
  
  
  final TextEditingController? mycontroller ;
  
  const Customtextformfiled({super.key, required this.hinttext, this.mycontroller, required this.icon,   });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
        controller: mycontroller,             
        decoration: InputDecoration(
         hintText: hinttext,hintStyle:const TextStyle(),
         contentPadding:const EdgeInsets.only(left: 10,top: 10),
         suffixIcon: Icon(icon),suffixIconColor: Colors.grey,
        )
      );
  }
}