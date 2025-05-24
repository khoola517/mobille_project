import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/Api_controller.dart';

class apidata extends StatefulWidget {
 
  @override
   apidata({super.key});

  @override
  State<apidata> createState() => _apidataState();
}

class _apidataState extends State<apidata> {
   ApiController controller=Get.put(ApiController());
   @override
  void initState() {
    controller.getposts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: Text("page 1"),) ,
      body:Obx(()=> ListView.builder(
        itemCount: controller.api.length,
        itemBuilder: (context,pos){
        return Container(
          margin: EdgeInsets.all(20),
          child: ListTile(
            title: Text(controller.api[pos].title!),
            subtitle:  Text(controller.api[pos].title!),
          )
          
        );
      }))
      );
  }
}