import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/globals/validation.dart';
import 'package:moderator_app/app/modules/write_comment/controllers/write_comment_controller.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class WriteCommentView extends GetView<WriteCommentController> {
  const WriteCommentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissable(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.title_write_a_comment,
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SectionTitle(
                  label: LocaleKeys.label_description,
                ),
                TextFormField(
                  controller: controller.commentController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: LocaleKeys.input_comment,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  validator: Validation.require(LocaleKeys.label_comment),
                ),
                16.y,
                FilledTonalButton(
                  icon: const Icon(AppIcons.addPhoto),
                  onPressed: controller.addPhotos,
                  child: Text(
                    LocaleKeys.button_add_photos,
                  ),
                ),
                16.y,
                Obx(() {
                  return Grid(
                    crossAxisCount: 3,
                    children: [
                      for (File imageFile in controller.images)
                        Stack(
                          children: [
                            Positioned.fill(
                              child: ClipRRect(
                                borderRadius: AppDimens.borderRadiusSm,
                                child: FadeInImage(
                                  image: FileImage(imageFile),
                                  placeholder: const AssetImage(AppStrings.reportImagePlaceholder),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              right: 5,
                              top: 5,
                              child: Material(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    controller.images.remove(imageFile);
                                  },
                                  borderRadius: BorderRadius.circular(100),
                                  child: SizedBox.square(
                                    dimension: 25,
                                    child: FittedBox(
                                      child: const Icon(
                                        AppIcons.delete,
                                        color: AppColors.danger,
                                      ).paddingAll(5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                    ],
                  );
                }),
              ],
            ).m,
          ),
        ),
        bottomNavigationBar: BottomButton(
          onPressed: controller.onSubmit,
          child: Text(
            LocaleKeys.button_submit,
          ),
        ).paddingAll(10),
      ),
    );
  }
}
