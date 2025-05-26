import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uyt/controller/onboarding_controller.dart';
import 'package:uyt/core/constant/color.dart';

class Custombutton extends GetView<OnboardingControllerImp> {
  // final String label;
  // final double width;
  // final double height;
  // final Color color;
  // final Color textColor;
  const Custombutton(
    // this.label, 
    // this.width,
    // this.height, 
    // this.color, 
    // this.textColor, 
    {super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingControllerImp>(
      builder: (_controller) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _controller.getButtons(),
      ),
     ),
    );
  }
}
