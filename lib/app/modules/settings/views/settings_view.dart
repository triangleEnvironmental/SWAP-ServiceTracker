import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/routes/app_pages.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/locales/index.dart';

import '../controllers/settings_controller.dart';
import 'setting_header.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleKeys.label_settings,
        ),
      ),
      body: SingleChildScrollView(
        child: ValueListenableBuilder(
          valueListenable: controller.authService.listenable,
          builder: (BuildContext context, Box<dynamic> authBox, Widget? child) {
            if (controller.authService.user == null) {
              return const SizedBox.shrink();
            }

            final user = controller.authService.user!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                10.y,
                SettingHeader(
                  imageUrl: user.profilePhotoUrl,
                  profile: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        user.fullName ?? user.firstName ?? '-',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (user.email != null)
                        Text(
                          user.email!,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ElevatedButton(
                        onPressed: controller.onEditProfile,
                        child: Text(LocaleKeys.button_edit_profile),
                      ).marginOnly(top: 10),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.label_settings,
                      style: context.textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                        .marginOnly(
                          top: 26,
                          bottom: 10,
                        )
                        .paddingSymmetric(
                          horizontal: AppDimens.marginHorizontal,
                        ),
                    ListTile(
                      onTap: openChangeLanguage,
                      leading: const Icon(
                        AppIcons.translate,
                      ),
                      title: Text(
                        LocaleKeys.label_change_language,
                      ),
                      subtitle: Text(
                        LocaleKeys.current_language,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: controller.changePassword,
                      leading: const Icon(
                        AppIcons.password,
                      ),
                      title: Text(
                        LocaleKeys.label_change_password,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.routeTerms);
                      },
                      leading: const Icon(
                        AppIcons.terms,
                      ),
                      title: Text(
                        LocaleKeys.label_terms_of_use,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.routePolicies);
                      },
                      leading: const Icon(
                        AppIcons.policy,
                      ),
                      title: Text(
                        LocaleKeys.label_privacy_policy,
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      onTap: () {
                        Get.toNamed(Routes.routeAbout);
                      },
                      leading: const Icon(
                        AppIcons.about,
                      ),
                      title: Text(
                        LocaleKeys.label_about_app,
                      ),
                    ),
                    const Divider(),
                    // ListTile(
                    //   onTap: controller.changeBrightness,
                    //   leading: const Icon(
                    //     AppIcons.brightness,
                    //   ),
                    //   title: Text(
                    //     context.theme.brightness == Brightness.dark ? LocaleKeys.label_change_to_light_mode : LocaleKeys.label_change_to_dark_mode,
                    //   ),
                    // ),
                    if (controller.authService.isLoggedIn)
                      ListTile(
                        onTap: controller.onLogOut,
                        leading: const Icon(
                          AppIcons.logOut,
                        ),
                        title: Text(
                          LocaleKeys.label_log_out,
                        ),
                      ),
                  ],
                ),
                40.y,
              ],
            );
          },
        ),
      ),
    );
  }
}
