import 'package:get/get.dart';
import 'package:moderator_app/app/modules/write_comment/controllers/write_comment_controller.dart';

class WriteCommentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WriteCommentController>(() => WriteCommentController());
  }
}
