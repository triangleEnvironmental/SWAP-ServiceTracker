import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/models/html_page.dart';
import 'package:moderator_app/app/modules/terms/controllers/terms_controller.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class TermsView extends GetView<TermsController> {
  const TermsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title_terms_of_use),
      ),
      // body: const HtmlRenderer(
      //   url: 'https://app.termly.io/document/terms-of-use-for-website/77013405-bb2d-4d93-ac95-1c592cb1b731',
      // ),
      body: RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: Obx(
              () => FutureBuilder<HtmlPage>(
            future: controller.future.value,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final HtmlPage page = snapshot.data!;

                return HtmlRenderer(
                  html: page.content,
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: LoadingWidget(),
                );
              } else {
                String errorMessage = LocaleKeys.phrase_not_your_mistake;

                errorMessage = getErrorMessage(snapshot.error);

                return ErrorView(
                  image: Image.asset(
                    AppStrings.errorImage,
                    width: Get.width * 0.8,
                  ),
                  title: LocaleKeys.label_something_went_wrong,
                  description: errorMessage,
                  bottom: FilledButton(
                    onPressed: controller.onRefresh,
                    icon: const Icon(AppIcons.refresh),
                    child: Text(LocaleKeys.button_try_again),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
