import 'package:get/get.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/modules/report/detail/controllers/detail_controller.dart';
import 'package:moderator_app/app/repositories/index.dart';
import 'package:moderator_app/app/utils/helpers.dart';
import 'package:moderator_app/locales/index.dart';

class AssignmentCreateController extends GetxController {
  final assignmentRepository = AssignmentRepository();
  int reportId = Get.arguments?['reportId'];
  Report? report = Get.arguments?['report'];
  late Rx<Future<AssignmentOption>> optionFuture;

  onSelectUser(User? user) async {
    late bool confirm;
    if (user == null) {
      confirm = await showConfirmDialog(
        title: LocaleKeys.label_unassign_current_assignee,
        content: LocaleKeys.confirm_unassign_current_user,
      );
    } else {
      confirm = await showConfirmDialog(
        title: LocaleKeys.label_assign_a_user,
        content: LocaleKeys.confirm_assign_to_someone({
          'name': user.fullName ?? '-',
        }),
      );
    }
    if (confirm) {
      startLoading();
      final result = await assignmentRepository.assignUser(
        reportId: reportId,
        userId: user?.id,
      );
      stopLoading();
      print("result");
      print(result);
      if (result == true) {
        print(result);
        try {
          final detailController = Get.find<ReportDetailController>();
          detailController.refreshReport();
        } catch (_) {}
        Get.back(
          result: true,
          closeOverlays: true,
        );
      }
    }
  }

  Future refreshReport() async {
    optionFuture.value = assignmentRepository.listAssignmentOption(reportId);
    await optionFuture.value;
  }

  @override
  void onInit() {
    optionFuture = assignmentRepository.listAssignmentOption(reportId).obs;
    super.onInit();
  }
}
