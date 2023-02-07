import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/modules/change_report_status/controllers/change_report_status_controller.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class _PreviewReport extends StatelessWidget {
  final Report report;

  const _PreviewReport(this.report, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserAvatar(
                  report.reporter?.profilePhotoUrl,
                  defaultAsset: AppStrings.avatarPlaceholder,
                ).sized(38).circle.paddingOnly(
                      right: 8,
                    ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Builder(
                                  builder: (context) {
                                    String? displayName = report.reporter?.fullName;
                                    bool hasName = false;
                                    if (report.reporter == null) {
                                      displayName = LocaleKeys.label_anonymous;
                                    } else if (displayName == null || displayName.isEmpty) {
                                      displayName = LocaleKeys.label_no_name;
                                    } else {
                                      hasName = true;
                                    }
                                    return Text(
                                      displayName,
                                      overflow: TextOverflow.ellipsis,
                                      style: Get.textTheme.subtitle1?.copyWith(
                                        color: hasName ? null : AppColors.greyText,
                                        fontWeight: hasName ? FontWeight.bold : FontWeight.normal,
                                        // fontStyle: hasName ? null : FontStyle.italic,
                                      ),
                                    );
                                  },
                                ),
                                RichText(
                                  textScaleFactor: Get.textScaleFactor,
                                  text: TextSpan(
                                    style: Get.textTheme.bodyText2?.copyWith(
                                      color: AppColors.greyText,
                                    ),
                                    children: [
                                      if (report.createdAt != null)
                                        TextSpan(
                                          text: displayReadableDate(report.createdAt!),
                                          style: const TextStyle(
                                            fontSize: 11,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (report.status != null)
                            Container(
                              margin: 3.pv,
                              padding: 6.ph,
                              decoration: BoxDecoration(
                                color: report.status?.color != null ? AppColors.fromHex(report.status!.color!) : AppColors.primaryColor,
                                borderRadius: AppDimens.borderRadiusLg,
                              ),
                              child: Text(
                                report.status!.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                      if (report.sector != null || report.reportType != null)
                        RichText(
                          textScaleFactor: Get.textScaleFactor,
                          text: TextSpan(
                            style: Get.textTheme.bodyText2,
                            children: [
                              if (report.sector != null) ...[
                                WidgetSpan(
                                  child: report.sector!.icon.sized(20),
                                ),
                                TextSpan(
                                  text: ' ${report.sector!.name}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (report.reportType != null)
                                  const TextSpan(
                                    text: ' : ',
                                  ),
                              ],
                              if (report.reportType != null)
                                TextSpan(
                                  text: report.reportType!.name,
                                ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            if (report.description != null)
              Text(
                report.description!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ).paddingSymmetric(
                vertical: 10,
              ),
            10.y,
            if (report.medias?.isNotEmpty ?? false)
              SizedBox(
                height: 70,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (final media in report.medias!)
                        UserAvatar(
                          media.mediaUrl,
                          previewIndex: report.medias!.indexOf(media),
                          previewImages: report.medias!.map((e) => NetworkImage(e.mediaUrl)).toList(),
                          defaultAsset: AppStrings.reportImagePlaceholder,
                        ).sized(70).roundedBordered(8).paddingOnly(
                              right: 10,
                            ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ChangeReportStatusView extends GetView<ChangeReportStatusController> {
  const ChangeReportStatusView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissable(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            LocaleKeys.title_change_status,
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.showPreview.value = !controller.showPreview.value;
                  },
                  child: Material(
                    color: Colors.transparent,
                    child: SectionTitle(
                      icon: AppIcons.preview,
                      label: LocaleKeys.label_report_preview,
                      trailing: Obx(
                        () {
                          var icon = AppIcons.more;
                          if (controller.showPreview.value) {
                            icon = AppIcons.expand;
                          }
                          return IconButton(
                            onPressed: () {
                              controller.showPreview.value = !controller.showPreview.value;
                            },
                            icon: Icon(icon),
                          );
                        },
                      ),
                    ).marginOnly(
                      left: AppDimens.marginHorizontal,
                    ),
                  ),
                ),
                Obx(
                  () => AnimatedSize(
                    duration: const Duration(milliseconds: 200),
                    child: Container(
                      constraints: controller.showPreview.value ? const BoxConstraints(maxHeight: double.infinity) : const BoxConstraints(maxHeight: 0.0),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: _PreviewReport(controller.report),
                      ),
                    ),
                  ),
                ).m,
                SectionTitle(
                  icon: AppIcons.changeStatus,
                  label: LocaleKeys.label_select_new_status,
                ).m,
                CustomFormField(
                  indent: AppDimens.marginHorizontal,
                  child: ValueListenableBuilder(
                    valueListenable: controller.informationService.reportFilterOption,
                    builder: (context, _, __) {
                      if (controller.statusOptions != null) {
                        return Obx(() {
                          return Column(
                            children: [
                              for (final status in controller.statusOptions!)
                                RadioListTile(
                                  value: status,
                                  selected: status == controller.newStatus.value,
                                  title: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          status.name,
                                          style: TextStyle(
                                            color: status.color != null ? AppColors.fromHex(status.color!) : null,
                                          ),
                                        ),
                                      ),
                                      if (controller.report.status == status)
                                        Text(
                                          '(${LocaleKeys.label_current_status})',
                                          style: const TextStyle(
                                            color: AppColors.greyText,
                                          ),
                                        ),
                                    ],
                                  ),
                                  groupValue: controller.newStatus.value,
                                  onChanged: (ReportStatus? status) {
                                    controller.newStatus.value = status;
                                  },
                                ),
                            ],
                          );
                        });
                      }

                      return Center(
                        child: const LoadingWidget().paddingSymmetric(vertical: 20),
                      );
                    },
                  ),
                  validator: (_) {
                    if (controller.report.status == controller.newStatus.value) {
                      return LocaleKeys.phrase_you_did_not_change_the_status;
                    } else if (controller.newStatus.value == null) {
                      return LocaleKeys.validate_select_a_new_status;
                    }
                    return null;
                  },
                ),
                SectionTitle(
                  icon: AppIcons.notificationMessage,
                  label: LocaleKeys.label_notification_message,
                  trailing: IconButton(
                    tooltip: LocaleKeys.label_select_notification_preset,
                    icon: const Icon(AppIcons.preset),
                    onPressed: controller.selectPreset,
                  ),
                ).m,
                Obx(() {
                  return Column(
                    children: [
                      TextFormField(
                        controller: controller.notificationTitleController,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: '${LocaleKeys.label_notification_title} : ${controller.defaultNotificationTitle}',
                        ),
                      ),
                      10.y,
                      TextFormField(
                        controller: controller.notificationBodyController,
                        textCapitalization: TextCapitalization.sentences,
                        maxLines: 4,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: '${LocaleKeys.label_notification_body} : ${controller.defaultNotificationBody}',
                        ),
                      ),
                    ],
                  ).m;
                }),
                30.y,
                BottomButton(
                  onPressed: controller.onSubmit,
                  child: Text(
                    LocaleKeys.button_submit,
                  ),
                ).m,
                40.y,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
