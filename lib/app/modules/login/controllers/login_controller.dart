import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/repositories/index.dart';
import 'package:moderator_app/app/routes/app_pages.dart';
import 'package:moderator_app/app/services/auth_service.dart';
import 'package:moderator_app/app/utils/helpers.dart';

class LoginController extends GetxController {
  final authRepository = AuthRepository();
  final authService = Get.find<AuthService>();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();

  forgotPassword() async {
    Get.toNamed(Routes.routeForgotPassword);
  }

  onSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      startLoading();
      final result = await authRepository.login(
        email: emailController.text.trim(),
        password: passwordController.text,
      );
      stopLoading();
      if (result is Auth) {
        authService.setAuth(result);
        Get.offAllNamed(Routes.routeHome);
      }
    }
  }
}