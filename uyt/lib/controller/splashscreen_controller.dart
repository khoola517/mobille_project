//import 'dart:nativewrappers/_internal/vm/lib/ffi_patch.dart';

import 'package:get/get.dart';
import 'package:uyt/core/constant/route.dart';
import 'package:uyt/routes.dart';
import 'package:uyt/view/screen/onboarding.dart';

abstract class SplashscreenController extends GetxController{
   goToSplashscreen();
}
class SplashScreenImp extends SplashscreenController{
  @override
  goToSplashscreen() {
    
    Get.off(OnBoarding());
  }

}