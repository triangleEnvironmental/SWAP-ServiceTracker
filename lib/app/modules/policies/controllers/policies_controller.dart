import 'package:get/get.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/repositories/index.dart';

class PoliciesController extends GetxController {
  final pageRepository = PageRepository();
  late Rx<Future<HtmlPage>> future;

  Future<HtmlPage> fetchDetail() async {
    return await pageRepository.policyPage();
  }

  Future onRefresh() async {
    future.value = fetchDetail();
    await future.value;
  }

  @override
  void onInit() {
    future = fetchDetail().obs;
    super.onInit();
  }
}
