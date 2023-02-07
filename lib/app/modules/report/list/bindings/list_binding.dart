import 'package:get/get.dart';
import 'package:moderator_app/app/modules/report/list/controllers/list_controller.dart';

class ReportListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportListController>(() => ReportListController());
  }
}
