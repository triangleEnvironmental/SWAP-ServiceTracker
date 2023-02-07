import 'package:get/get.dart';
import 'package:moderator_app/app/modules/notification/preset/controllers/preset_controller.dart';

class NotificationPresetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationPresetController>(() => NotificationPresetController());
  }
}
