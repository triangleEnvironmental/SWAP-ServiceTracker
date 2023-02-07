import 'package:get/get.dart';
import 'package:moderator_app/app/modules/report/detail/controllers/detail_controller.dart';

class ReportDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportDetailController>(
      () => ReportDetailController(),
      tag: "${Get.arguments?['id']}",
    );
  }
}
