import 'package:get/get.dart';
import 'package:moderator_app/app/modules/policies/controllers/policies_controller.dart';

class PoliciesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PoliciesController>(() => PoliciesController());
  }
}
