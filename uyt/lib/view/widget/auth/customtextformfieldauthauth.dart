import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:uyt/core/constant/color.dart';

class Customtextformfield extends StatelessWidget {
  final String hinttext ;
  final TextEditingController mycontroller ;
  final String? Function(String?) valid; 
  final bool isPassword;
  //final bool isnumber;
  const Customtextformfield(
    {super.key, 
    required this.hinttext, 
    required this.mycontroller, 
    required this.valid,  this.isPassword=false});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin:const EdgeInsets.only(top: 20),
      child: TextFormField(
        validator: valid,
        controller: mycontroller,
        obscureText: isPassword,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          contentPadding:const EdgeInsets.symmetric(vertical: 5),
          hintText: hinttext,hintStyle: TextStyle(color: Colors.grey,fontFamily: "Flutter"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            
          ),
          focusedBorder:const OutlineInputBorder(
             borderSide: BorderSide(color:ColorApp.backgroundcolor,width: 3)
          ),
          enabledBorder:const OutlineInputBorder(
             borderSide: BorderSide(color:ColorApp.primarycolor,width: 2)
          ),
           errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
          filled: true,
          fillColor:ColorApp.softcolorblue,
          
        ),
      ),
    );
  }
}