import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/repositories/index.dart';
import 'package:moderator_app/app/utils/index.dart';

class NotificationPresetController extends GetxController {
  final notificationRepository = NotificationRepository();
  final PagingController<int, NotificationPreset> pagingController = PagingController(firstPageKey: 1);
  Rx<int> totalPresets = 0.obs;

  Future onRefresh() async {
    nextTick(() {
      totalPresets.value = 0;
    });
    pagingController.refresh();
  }

  _fetchPage(int page) async {
    try {
      final pagination = await notificationRepository.listNotificationPresetOptions(
        page: page,
        reportId: Get.arguments?['reportId'],
      );
      nextTick(() {
        totalPresets.value = pagination.total;
      });
      final isLastPage = !pagination.hasMorePage;
      // pagingController.appendLastPage([]);
      if (isLastPage) {
        pagingController.appendLastPage(pagination.getData());
      } else {
        final nextPageKey = pagination.currentPage + 1;
        pagingController.appendPage(pagination.getData(), nextPageKey);
      }
    } catch (error) {
      print(error);
      pagingController.error = error;
    }
  }

  @override
  void onInit() {
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.onInit();
  }
}
