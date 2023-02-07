import 'package:get/get.dart';
import 'package:moderator_app/app/modules/change_report_status/controllers/change_report_status_controller.dart';

class ChangeReportStatusBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangeReportStatusController>(() => ChangeReportStatusController());
  }
}
