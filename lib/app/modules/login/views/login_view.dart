import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/globals/validation.dart';
import 'package:moderator_app/app/modules/login/controllers/login_controller.dart';
import 'package:moderator_app/app/routes/app_pages.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissable(
      child: Scaffold(
        // appBar: AppBar(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.marginHorizontal,
          ),
          child: SafeArea(
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  10.y,
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () {
                        openChangeLanguage();
                      },
                      icon: currentLocaleIcon,
                      label: Text(currentLocaleText),
                    ),
                  ),
                  LimitedBox(
                    maxHeight: 180,
                    child: Image.asset(AppStrings.appGraphicImage),
                  ),
                  // Text(
                  //   LocaleKeys.phrase_enter_email_password,
                  //   textAlign: TextAlign.center,
                  //   style: Get.textTheme.bodyLarge,
                  // ).marginOnly(
                  //   top: 20,
                  //   bottom: 20,
                  // ),
                  TextFormField(
                    controller: controller.emailController,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autofillHints: const [AutofillHints.email],
                    decoration: InputDecoration(
                      hintText: LocaleKeys.input_your_email,
                      labelText: LocaleKeys.input_your_email,
                      icon: const Icon(AppIcons.email),
                    ),
                    validator: Validation.require(LocaleKeys.label_email),
                  ),
                  10.y,
                  TextFormField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: LocaleKeys.input_password,
                      labelText: LocaleKeys.input_password,
                      icon: const Icon(AppIcons.password),
                    ),
                    onFieldSubmitted: (_) {
                      controller.onSubmit();
                    },
                    validator: Validation.require(LocaleKeys.label_password),
                  ),
                  40.y,
                  BottomButton(
                    onPressed: controller.onSubmit,
                    child: Text(
                      LocaleKeys.button_login,
                    ),
                  ),
                  BottomButton(
                    buttonType: ButtonType.text,
                    onPressed: controller.forgotPassword,
                    child: Text(
                      LocaleKeys.button_forgot_password,
                    ),
                  ),
                  20.y,
                  RichText(
                    textScaleFactor: Get.textScaleFactor,
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: Get.textTheme.bodyText2,
                      children: [
                        TextSpan(
                          text: '${LocaleKeys.phrase_using_app_accept}\n',
                        ),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.routeTerms);
                            },
                            child: Text(
                              LocaleKeys.title_terms_of_use,
                              style: Get.textTheme.bodySmall?.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        TextSpan(
                          text: ' ${LocaleKeys.label_and} ',
                        ),
                        WidgetSpan(
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.routePolicies);
                            },
                            child: Text(
                              LocaleKeys.title_privacy_policy,
                              style: Get.textTheme.bodySmall?.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  60.y,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
