import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/globals/validation.dart';
import 'package:moderator_app/app/modules/forgot_password/controllers/forgot_password_controller.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissable(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.title_forgot_password,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.marginHorizontal,
          ),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LimitedBox(
                  maxHeight: 200,
                  child: Image.asset(AppStrings.forgotPasswordImage),
                ),
                Text(
                  LocaleKeys.phrase_email_for_reset_password,
                  textAlign: TextAlign.center,
                  style: Get.textTheme.bodyLarge,
                ).marginOnly(
                  top: 20,
                  bottom: 20,
                ),
                TextFormField(
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.input_your_email,
                    labelText: LocaleKeys.input_your_email,
                    icon: const Icon(AppIcons.email),
                  ),
                  onFieldSubmitted: (_) {
                    controller.onSubmit();
                  },
                  validator: Validation.require(LocaleKeys.label_email),
                ),
                40.y,
                BottomButton(
                  onPressed: controller.onSubmit,
                  child: Text(
                    LocaleKeys.button_submit,
                  ),
                ),
                60.y,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
