import 'package:get/get.dart';
import 'package:moderator_app/app/modules/assignment/list/controllers/list_controller.dart';

class AssignmentListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssignmentListController>(() => AssignmentListController());
  }
}
