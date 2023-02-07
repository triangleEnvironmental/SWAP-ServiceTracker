import 'package:get/get.dart';
import 'package:moderator_app/app/modules/report/moderation_history/controllers/moderation_history_controller.dart';

class ReportModerationHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportModerationHistoryController>(() => ReportModerationHistoryController());
  }
}
