import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/settingController.dart';


class SettingsPage extends StatelessWidget {
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الإعدادات', style: TextStyle(fontFamily: "Flutter")),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('الوضع الليلي', style: TextStyle(fontSize: 18, fontFamily: "Flutter")),
                Switch(
                  value: themeController.isDarkMode.value,
                  onChanged: (val) {
                    themeController.toggleTheme();
                  },
                )
              ],
            )),
      ),
    );
  }
}
