import 'package:get/get.dart';
import 'package:moderator_app/app/modules/report/map/controllers/map_controller.dart';

class ReportMapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportMapController>(() => ReportMapController());
  }
}
