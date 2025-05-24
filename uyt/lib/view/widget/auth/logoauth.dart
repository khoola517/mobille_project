import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Logoauth extends StatelessWidget {
  const Logoauth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset("images/logo.png",height: 137,width: 127,fit: BoxFit.fill,);
  }
}