import 'package:get/get.dart';
import 'package:moderator_app/app/modules/assignment/create/controllers/assignment_create_controller.dart';

class AssignmentCreateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssignmentCreateController>(() => AssignmentCreateController());
  }
}
