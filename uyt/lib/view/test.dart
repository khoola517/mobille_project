import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Column(children: [
        SizedBox(height: 40,),
        Text("jjjjjjjjj",style: TextStyle(fontSize: 30,fontFamily: 'n'),),
        Text("jjjjjjjjj",style: TextStyle(fontSize: 30,),),
        Text(" صحي صحي خوله",style: TextStyle(fontSize: 30,fontFamily: "Flutter"),),
        Text("خوله",style: TextStyle(fontSize: 30,fontFamily: "Flu"),),
        Text("خوله",style: TextStyle(fontSize: 30,),)
      ],),
    ),);
  }
}