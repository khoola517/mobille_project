import 'package:flutter/material.dart';
import 'package:uyt/test/Model/models.dart';
//import 'models.dart';

class ChildDetailsScreen extends StatelessWidget {
  final Child child;

  ChildDetailsScreen({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تفاصيل الطفل')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('الاسم: ${child.name}', style: TextStyle(fontSize: 20)),
            // يمكنك إضافة المزيد من التفاصيل هنا
          ],
        ),
      ),
    );
  }
}