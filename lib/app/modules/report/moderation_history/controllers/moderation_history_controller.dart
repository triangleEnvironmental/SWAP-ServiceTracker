import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/repositories/index.dart';
import 'package:moderator_app/app/utils/index.dart';

class ReportModerationHistoryController extends GetxController {
  final moderationRepository = ModerationRepository();
  final PagingController<int, ModerationHistory> pagingController = PagingController(firstPageKey: 1);
  Rx<int> totalReports = 0.obs;

  Future onRefresh() async {
    nextTick(() {
      totalReports.value = 0;
    });
    pagingController.refresh();
  }

  _fetchPage(int page) async {
    try {
      final pagination = await moderationRepository.listModerationHistory(
        page: page,
      );
      nextTick(() {
        totalReports.value = pagination.total;
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
