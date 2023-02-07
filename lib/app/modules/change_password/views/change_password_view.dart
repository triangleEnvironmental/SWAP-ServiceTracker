import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/globals/validation.dart';
import 'package:moderator_app/app/globals/validation.dart';
import 'package:moderator_app/app/globals/validation.dart';
import 'package:moderator_app/app/modules/change_password/controllers/change_password_controller.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissable(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.label_change_password,
          ),
        ),
        bottomNavigationBar: BottomButton(
          onPressed: controller.onSubmit,
          child: Text(
            LocaleKeys.button_submit,
          ),
        ).paddingAll(10),
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: controller.currentPassword,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.label_current_password,
                    labelText: LocaleKeys.label_current_password,
                    icon: const Icon(AppIcons.password),
                  ),
                  validator: Validation.require(LocaleKeys.label_current_password),
                ),
                TextFormField(
                  controller: controller.newPassword,
                  textInputAction: TextInputAction.next,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.label_new_password,
                    labelText: LocaleKeys.label_new_password,
                    icon: const Icon(AppIcons.password),
                  ),
                  validator: Validation.require(LocaleKeys.label_new_password),
                ),
                TextFormField(
                  controller: controller.confirmPassword,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.label_confirm_password,
                    labelText: LocaleKeys.label_confirm_password,
                    icon: const Icon(AppIcons.password),
                  ),
                  validator: Validation.require(LocaleKeys.label_confirm_password),
                  onFieldSubmitted: (_) {
                    controller.onSubmit();
                  },
                ),
              ],
            ).m,
          ),
        ),
      ),
    );
  }
}
