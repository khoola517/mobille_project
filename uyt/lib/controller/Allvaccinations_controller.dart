import 'package:get/get.dart';
import 'package:uyt/core/constant/route.dart';
import 'package:uyt/view/screen/completed_vaccniation.dart';

abstract class  AllvaccinationsController extends GetxController{
 goToUpcoming_Vaccinations();
 goToCompleted_Vaccinations();
 goToAllvaccinations();
}
class AllvaccinationsControllerImp extends AllvaccinationsController{
  
  
  
  @override
  goToUpcoming_Vaccinations() {
    Get.toNamed(AppRoute.upcoming_vaccinations);
  }
  
  @override
  goToCompleted_Vaccinations() {
   Get.toNamed(AppRoute.completed_vaccniation);
  }
  
  @override
  goToAllvaccinations() {
    Get.toNamed(AppRoute.allvaccinations);
  }
}