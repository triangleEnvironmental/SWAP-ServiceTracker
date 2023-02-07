import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/modules/policies/controllers/policies_controller.dart';
import 'package:moderator_app/locales/index.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/models/html_page.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/widgets/index.dart';


class PoliciesView extends GetView<PoliciesController> {
  const PoliciesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title_privacy_policy),
      ),
      // body: const HtmlRenderer(
      //   url: 'https://app.termly.io/document/privacy-policy/db9ebdb7-1a8d-439b-b7c7-80002de0da8a',
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
