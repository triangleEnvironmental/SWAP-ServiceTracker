import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/globals/validation.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/repositories/index.dart';
import 'package:moderator_app/app/services/index.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class ProfileController extends GetxController {
  final authService = Get.find<AuthService>();
  final authRepository = AuthRepository();
  final formKey = GlobalKey<FormState>();
  late TextEditingController fullNameController;
  late TextEditingController emailController;

  deleteProfilePhoto() async {
    final confirm = await showConfirmDialog(
      title: LocaleKeys.label_delete_profile_photo,
      content: LocaleKeys.phrase_delete_profile_photo,
    );

    if (confirm) {
      startLoading();
      final result = await authRepository.updateProfilePhoto(null);
      stopLoading();
      if (result is User) {
        authService.setUser(result);
      }
    }
  }

  updateProfilePhoto() async {
    final photo = await pickPhoto();
    if (photo != null) {
      startLoading();
      final result = await authRepository.updateProfilePhoto(photo);
      stopLoading();
      if (result is User) {
        authService.setUser(result);
      }
    }
  }

  editInfo(TextEditingController clickedTextFieldController) async {
    if (Get.context == null) {
      return null;
    }

    fullNameController.text = authService.user?.fullName ?? '';
    emailController.text = authService.user?.email ?? '';

    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: AppDimens.radiusLg,
        ),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.marginHorizontal,
            vertical: 10,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SectionTitle(
                        icon: AppIcons.personal,
                        label: LocaleKeys.label_personal_information,
                      ),
                    ),
                    ValueListenableBuilder(
                      valueListenable: fullNameController,
                      builder: (context, TextEditingValue fullNameInput, _) {
                        return ValueListenableBuilder(
                          valueListenable: emailController,
                          builder: (context, TextEditingValue emailInput, _) {
                            if (fullNameInput.text.trim() != authService.user?.fullName || emailInput.text.trim() != authService.user?.email) {
                              return FilledButton(
                                onPressed: submitInfo,
                                child: Text(
                                  LocaleKeys.button_submit,
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
                TextFormField(
                  controller: fullNameController,
                  textCapitalization: TextCapitalization.words,
                  autofocus: clickedTextFieldController == fullNameController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.input_full_name,
                    label: Text(LocaleKeys.label_full_name),
                  ),
                  validator: Validation.require(LocaleKeys.label_full_name),
                ).marginOnly(bottom: 8),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: clickedTextFieldController == emailController,
                  decoration: InputDecoration(
                    hintText: LocaleKeys.input_email,
                    label: Text(LocaleKeys.label_email),
                  ),
                  validator: Validation.require(LocaleKeys.label_email),
                ).marginOnly(bottom: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  submitInfo() async {
    if (formKey.currentState?.validate() ?? false) {
      startLoading();
      final result = await authRepository.updateInfo(
        fullName: fullNameController.text.trim(),
        email: emailController.text.trim(),
      );
      stopLoading();
      if (result is User) {
        authService.setUser(result);
        Get.back(
          closeOverlays: false,
        );
      }
    }
  }

  @override
  void onInit() {
    authService.updateUser();
    fullNameController = TextEditingController(text: authService.user?.fullName ?? '');
    emailController = TextEditingController(text: authService.user?.email ?? '');
    super.onInit();
  }
}
