import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/models/assignment_option.dart';
import 'package:moderator_app/app/modules/assignment/create/controllers/assignment_create_controller.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class AssignmentCreateView extends GetView<AssignmentCreateController> {
  const AssignmentCreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.title_assign_a_user),
        actions: [
          if (controller.report?.assignee?.id != null)
            IconButton(
              onPressed: () {
                controller.onSelectUser(null);
              },
              color: AppColors.danger,
              tooltip: LocaleKeys.label_unassign_current_assignee,
              icon: const Icon(AppIcons.unassignment),
            ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.refreshReport,
        child: Obx(
          () {
            return FutureBuilder<AssignmentOption>(
              future: controller.optionFuture.value,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final assigneeId = controller.report?.assignee?.id;
                  final option = snapshot.data!;
                  return CustomScrollView(
                    slivers: [
                      if (option.adminUsers.isNotEmpty)
                        SliverStickyHeader(
                          header: Material(
                            child: SectionTitle(
                              icon: AppIcons.assignment,
                              label: LocaleKeys.label_assign_a_user,
                            ).m,
                          ),
                          sliver: SliverList(
                            delegate: SliverChildListDelegate([
                              for (final user in option.adminUsers)
                                Material(
                                  color: assigneeId == user.id ? AppColors.primaryMaterialColor[100] : Colors.white,
                                  elevation: 2,
                                  shadowColor: AppColors.shadowColor,
                                  borderRadius: AppDimens.borderRadiusMd,
                                  child: InkWell(
                                    onTap: assigneeId == user.id
                                        ? null
                                        : () {
                                            controller.onSelectUser(user);
                                          },
                                    borderRadius: AppDimens.borderRadiusMd,
                                    child: Row(
                                      children: [
                                        UserAvatar(user.profilePhotoUrl).sized(45).circle,
                                        8.x,
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                user.fullName ?? '-',
                                                style: Get.textTheme.bodyText1,
                                              ),
                                              if (user.role != null)
                                                Pill(
                                                  padding: const EdgeInsets.symmetric(
                                                    horizontal: 8,
                                                    vertical: 1,
                                                  ),
                                                  text: user.role!.name,
                                                ),
                                            ],
                                          ),
                                        ),
                                        if (assigneeId == user.id)
                                          const Icon(
                                            AppIcons.check,
                                            color: AppColors.success,
                                          ),
                                      ],
                                    ).marginAll(10),
                                  ),
                                ).marginSymmetric(
                                  horizontal: AppDimens.marginHorizontal,
                                  vertical: 5,
                                ),
                              10.y,
                            ]),
                          ),
                        ),
                      for (final institution in option.institutions)
                        if (institution.users != null && institution.users!.isNotEmpty)
                          SliverStickyHeader(
                            header: Material(
                              child: Row(
                                children: [
                                  UserAvatar(institution.logoUrl).sized(30),
                                  8.x,
                                  RichText(
                                    textScaleFactor: Get.textScaleFactor,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                      style: Get.textTheme.bodyText2,
                                      children: [
                                        TextSpan(
                                          text: institution.name,
                                          style: Get.textTheme.subtitle1?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' (${(institution.isMunicipality ?? false) ? LocaleKeys.label_municipality : LocaleKeys.label_service_provider})',
                                          style: Get.textTheme.bodyText2?.copyWith(
                                            color: AppColors.greyText,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ).marginSymmetric(
                                horizontal: AppDimens.marginHorizontal,
                                vertical: 12,
                              ),
                            ),
                            sliver: SliverList(
                              delegate: SliverChildListDelegate([
                                for (final user in institution.users!)
                                  Material(
                                    color: assigneeId == user.id ? AppColors.primaryMaterialColor[100] : Colors.white,
                                    elevation: 2,
                                    shadowColor: AppColors.shadowColor,
                                    borderRadius: AppDimens.borderRadiusMd,
                                    child: InkWell(
                                      borderRadius: AppDimens.borderRadiusMd,
                                      onTap: assigneeId == user.id
                                          ? null
                                          : () {
                                              controller.onSelectUser(user);
                                            },
                                      child: Row(
                                        children: [
                                          UserAvatar(user.profilePhotoUrl).sized(45).circle,
                                          8.x,
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  user.fullName ?? '-',
                                                  style: Get.textTheme.bodyText1,
                                                ),
                                                if (user.role != null)
                                                  Pill(
                                                    padding: const EdgeInsets.symmetric(
                                                      horizontal: 8,
                                                      vertical: 1,
                                                    ),
                                                    text: user.role!.name,
                                                  ),
                                              ],
                                            ),
                                          ),
                                          if (assigneeId == user.id)
                                            const Icon(
                                              AppIcons.check,
                                              color: AppColors.success,
                                            ),
                                        ],
                                      ).marginAll(10),
                                    ),
                                  ).marginSymmetric(
                                    horizontal: AppDimens.marginHorizontal,
                                    vertical: 5,
                                  ),
                                10.y,
                              ]),
                            ),
                          ),
                      40.y.sliver,
                    ],
                  );
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: LoadingWidget(),
                  );
                } else {
                  String errorMessage = LocaleKeys.phrase_not_your_mistake;

                  errorMessage = getErrorMessage(
                    snapshot.error,
                    notFoundMessage: LocaleKeys.label_report_deleted,
                  );

                  return ErrorView(
                    image: Image.asset(
                      AppStrings.errorImage,
                      width: Get.width * 0.8,
                    ),
                    title: LocaleKeys.label_something_went_wrong,
                    description: errorMessage,
                    bottom: FilledButton(
                      onPressed: controller.refreshReport,
                      icon: const Icon(AppIcons.refresh),
                      child: Text(LocaleKeys.button_try_again),
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
