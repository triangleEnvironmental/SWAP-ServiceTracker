import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.authService.listenable,
      builder: (BuildContext context, Box<dynamic> authBox, Widget? child) {
        final user = controller.authService.user!;
        return KeyboardDismissable(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                LocaleKeys.title_profile,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        if (user.profilePhotoUrl != null) {
                          viewPhoto(
                            images: [NetworkImage(user.profilePhotoUrl!)],
                          );
                        }
                      },
                      child: Hero(
                        tag: 'USER-PROFILE',
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 3,
                            ),
                          ),
                          child: UserAvatar(
                            user.profilePhotoUrl ?? '',
                            name: user.fullName,
                          ).sized(120).circle,
                        ),
                      ),
                    ),
                  ).paddingSymmetric(
                    vertical: 10,
                    horizontal: AppDimens.marginHorizontal,
                  ),
                  10.y,
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton.icon(
                        onPressed: controller.updateProfilePhoto,
                        icon: const Icon(AppIcons.addPhoto),
                        label: Text(
                          LocaleKeys.button_upload,
                        ),
                      ),
                      if (user.profilePhotoPath != null)
                        FilledTonalButton(
                          color: AppColors.danger,
                          onPressed: controller.deleteProfilePhoto,
                          child: const Icon(AppIcons.delete),
                        ).marginOnly(left: 4),
                    ],
                  ),
                  20.y,
                  SectionTitle(
                    icon: AppIcons.personal,
                    label: LocaleKeys.label_personal_information,
                  ).m,
                  TextFormField(
                    controller: TextEditingController(text: user.fullName ?? ''),
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      hintText: LocaleKeys.input_full_name,
                      label: Text(LocaleKeys.label_full_name),
                    ),
                    onTap: () {
                      controller.editInfo(controller.fullNameController);
                    },
                    readOnly: true,
                  ).m,
                  8.y,
                  TextFormField(
                    controller: TextEditingController(text: user.email ?? ''),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: LocaleKeys.input_email,
                      label: Text(LocaleKeys.label_email),
                    ),
                    onTap: () {
                      controller.editInfo(controller.emailController);
                    },
                    readOnly: true,
                  ).m,
                  8.y,
                  if (user.institution != null) ...[
                    SectionTitle(
                      icon: user.institution?.isServiceProvider ?? false ? AppIcons.serviceProvider : AppIcons.municipality,
                      label: LocaleKeys.label_my_institution,
                    ).m,
                    Column(
                      children: [
                        ListTile(
                          leading: user.institution!.logo.sized(40).circle,
                          title: Text(user.institution!.name),
                          trailing: SizedBox(
                            width: 100,
                            child: Flex(
                              mainAxisAlignment: MainAxisAlignment.end,
                              direction: Axis.horizontal,
                              children: [
                                for (Sector sector in user.institution!.sectors ?? [])
                                  sector.icon.sized(20).circle.marginOnly(
                                        left: 2,
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (user.role != null) ...[
                    SectionTitle(
                      icon: AppIcons.role,
                      label: LocaleKeys.label_role,
                      trailing: Text(user.role!.name),
                    ).m,
                  ],
                  40.y,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
