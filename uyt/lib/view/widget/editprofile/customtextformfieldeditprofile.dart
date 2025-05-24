import 'package:flutter/material.dart';
import 'package:uyt/core/constant/color.dart';

class Customtextformfieldeditprofile extends StatelessWidget {
  final IconData icondata;
  final TextEditingController? mycontroller ;
  final String? Function(String?) valid;
  const Customtextformfieldeditprofile({super.key, required this.icondata, this.mycontroller, required this.valid});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
      child: Container(
        height: 35,
        //margin:const EdgeInsets.only(top: 20),
        child: TextFormField(
          validator: valid,
          // textAlign: TextAlign.center,
            controller: mycontroller,             
            decoration: InputDecoration(
             //contentPadding: EdgeInsets.symmetric(vertical: 5),
             suffixIcon: Icon(icondata),suffixIconColor: Colors.grey,
             focusedBorder:const OutlineInputBorder(
               borderSide: BorderSide(color:ColorApp.primarycolor,width: 2)
            ),
            enabledBorder:const OutlineInputBorder(
               borderSide: BorderSide(color:Colors.grey,width: 2)
            ),
            )
          ),
      ),
    );
  }
}