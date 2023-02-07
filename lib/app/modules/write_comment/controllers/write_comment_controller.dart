import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/repositories/index.dart';
import 'package:moderator_app/app/utils/helpers.dart';

class WriteCommentController extends GetxController {
  final report = Get.arguments?['report'] as Report;

  final commentRepository = CommentRepository();
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController commentController = TextEditingController();
  final RxList<File> images = RxList();

  addPhotos() async {
    closeKeyboard();
    final result = await pickPhotos();
    if (result != null) {
      images.addAll(result);
    }
  }

  onSubmit() async {
    if (formKey.currentState?.validate() ?? false) {
      final indicator = ValueNotifier(0.0);
      startLoading(
        indicator: indicator,
      );
      final result = await commentRepository.createComment(
        reportId: report.id,
        text: commentController.text.trim(),
        images: images.value,
        indicator: indicator,
      );
      stopLoading();

      if (result is Comment) {
        Get.back(
          result: result,
          closeOverlays: true,
        );
      }
    }
  }
}
