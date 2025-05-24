import 'package:flutter/src/widgets/editable_text.dart';
import 'package:get/get.dart';

validInput(val,min,max,type){
  // if(type=="username"){
  //   if(!GetUtils.isUsername(val)){
  //     return "not valid user name";
  //   }
  // }
  // if(type=="password"){
  //   if(!GetUtils.isUsername(val)){
  //     return "not valid password";
  //   }
  // }
  
  if(type=="name"){
    if(!GetUtils.isUsername(val)){
      return "not valid name";
    }
  }
   if(type=="phone"){
    if(!GetUtils.isUsername(val)){
      return "not valid name";
    }
  }
   if(type=="email"){
    if(!GetUtils.isUsername(val)){
      return "not valid email";
    }
  }
  if(type=="location"){
    if(!GetUtils.isUsername(val)){
      return "not valid email";
    }
  }
  
  if(val.isEmpty && type=="username"){
    return "38".tr;
  }
  if(val.isEmpty && type=="password"){
    return "37".tr;
  }
  if(val.length<min){
    return "39".tr;
  }
  //edit in locale file
  if(val.length>max){
    return "value canot larg $max";
  }
}