import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/extensions/index.dart';
import 'package:moderator_app/app/globals/report_filter.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/services/index.dart';
import 'package:moderator_app/app/services/information_service.dart';
import 'package:moderator_app/app/utils/helpers.dart';
import 'package:moderator_app/app/widgets/index.dart';
import 'package:moderator_app/locales/index.dart';

class ReportFilterWidget extends StatefulWidget {
  final ReportFilter filter;

  const ReportFilterWidget({
    Key? key,
    required this.filter,
  }) : super(key: key);

  @override
  State<ReportFilterWidget> createState() => _ReportFilterWidgetState();
}

class _ReportFilterWidgetState extends State<ReportFilterWidget> {
  final informationService = Get.find<InformationService>();
  late ReportFilterOption filterOptions;

  ReportFilter get filter => widget.filter;

  onPickDateRange() async {
    final now = DateTime.now();
    final result = await showDateRangePicker(
      context: context,
      initialDateRange: filter.defaultRange,
      lastDate: DateTime.now(),
      firstDate: filterOptions.minDate,
      currentDate: now,
      initialEntryMode: DatePickerEntryMode.calendar,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Get.theme.copyWith(
            colorScheme: Get.theme.colorScheme.copyWith(
              primary: AppColors.primaryMaterialColor,
              onPrimary: Colors.black,
              // surface: AppColors.accentMaterialColor,
              // onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (result is DateTimeRange) {
      filter.update(() {
        filter.dateRange = result;
      });
    }
  }

  @override
  void initState() {
    filterOptions = informationService.reportFilterOption.value!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.filter,
      builder: (context, _, __) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(AppIcons.close),
              onPressed: () {
                Get.back();
              },
            ),
            title: Text(LocaleKeys.title_report_filters),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                if (filterOptions.sectors.isNotEmpty) ...[
                  SectionTitle(
                    icon: AppIcons.sector,
                    label: LocaleKeys.label_sectors,
                    trailing: filter.sector == null
                        ? null
                        : SmallIconButton(
                            onPressed: () {
                              filter.update(() {
                                filter.sector = null;
                                filter.types = [];
                              });
                            },
                            icon: AppIcons.clear,
                            color: AppColors.danger,
                          ),
                  ).m,
                  for (final sector in filterOptions.sectors) ...[
                    RadioListTile<Sector>(
                      onChanged: (sector) {
                        filter.update(() {
                          filter.sector = sector;
                          filter.types = [];
                        });
                      },
                      groupValue: filter.sector,
                      value: sector,
                      title: Text(sector.name),
                      secondary: sector.icon.sized(40),
                    ),
                    // if (filterOptions.sectors.last != sector)
                    const Divider(height: 1),
                  ],
                ],
                if (filter.sector != null && (filter.sector!.reportTypes?.isNotEmpty ?? false)) ...[
                  SectionTitle(
                    icon: AppIcons.reportType,
                    label: LocaleKeys.label_report_type,
                    trailing: filter.types.isEmpty
                        ? null
                        : SmallIconButton(
                            onPressed: () {
                              filter.update(() {
                                filter.types = [];
                              });
                            },
                            icon: AppIcons.clear,
                            color: AppColors.danger,
                          ),
                  ).m,
                  for (ReportType reportType in filter.sector!.reportTypes ?? []) ...[
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (checked) {
                        filter.update(() {
                          filter.types.toggle(reportType);
                        });
                      },
                      tristate: true,
                      value: filter.types.contains(reportType),
                      title: Text(reportType.name),
                    ),
                    // if (filter.sector!.reportTypes!.last != reportType)
                    const Divider(height: 1),
                  ],
                ],
                SectionTitle(
                  icon: AppIcons.status,
                  label: LocaleKeys.label_report_status,
                  trailing: filter.statuses.isEmpty
                      ? null
                      : SmallIconButton(
                          onPressed: () {
                            filter.update(() {
                              filter.statuses = [];
                            });
                          },
                          icon: AppIcons.clear,
                          color: AppColors.danger,
                        ),
                ).m,
                for (ReportStatus status in filterOptions.statuses) ...[
                  CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (checked) {
                      filter.update(() {
                        filter.statuses.toggle(status);
                      });
                    },
                    tristate: true,
                    value: filter.statuses.contains(status),
                    title: Text(status.name),
                    secondary: status.color == null
                        ? null
                        : Container(
                            decoration: BoxDecoration(
                              color: AppColors.fromHex(status.color!),
                              shape: BoxShape.circle,
                            ),
                            height: 20,
                            width: 20,
                          ),
                  ),
                  const Divider(height: 1),
                ],
                SectionTitle(
                  icon: AppIcons.dateRange,
                  label: LocaleKeys.label_date_range,
                  trailing: filter.dateRange == null
                      ? null
                      : SmallIconButton(
                          onPressed: () {
                            filter.update(() {
                              filter.dateRange = null;
                            });
                          },
                          icon: AppIcons.clear,
                          color: AppColors.danger,
                        ),
                ).m,
                SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: onPickDateRange,
                    child: Container(
                      margin: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.lineColor),
                        borderRadius: AppDimens.borderRadiusMd,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  if (filter.dateRange == null) {
                                    return Text(
                                      LocaleKeys.input_select_date_range,
                                      style: Get.textTheme.bodyText1?.copyWith(
                                        color: AppColors.greyText,
                                      ),
                                    );
                                  } else {
                                    return Text(
                                      "${formatShortDate(filter.dateRange!.start)} - ${formatShortDate(filter.dateRange!.end)}",
                                    );
                                  }
                                },
                              ),
                            ),
                            6.x,
                            const Icon(
                              AppIcons.dateRange,
                              color: AppColors.greyText,
                            ),
                          ],
                        ),
                      ),
                    ).m,
                  ),
                ).marginSymmetric(vertical: 10),
                if (filterOptions.provinces.isNotEmpty) ...[
                  SectionTitle(
                    icon: AppIcons.province,
                    label: LocaleKeys.label_province_city,
                    trailing: filter.provinces.isEmpty
                        ? null
                        : SmallIconButton(
                            onPressed: () {
                              filter.update(() {
                                filter.provinces.clear();
                              });
                            },
                            icon: AppIcons.clear,
                            color: AppColors.danger,
                          ),
                  ).m,
                  for (Area province in List.from(filterOptions.provinces)..sort((p1, p2) => p1.name.compareTo(p2.name))) ...[
                    CheckboxListTile(
                      controlAffinity: ListTileControlAffinity.leading,
                      onChanged: (checked) {
                        filter.update(() {
                          filter.provinces.toggle(province);
                        });
                      },
                      tristate: true,
                      value: filter.provinces.contains(province),
                      title: Text(province.name),
                    ),
                    const Divider(height: 1),
                  ],
                ],
              ],
            ),
          ),
          bottomNavigationBar: Row(
            children: [
              Expanded(
                child: BottomButton(
                  buttonType: ButtonType.filledTonal,
                  onPressed: () {
                    filter.reset();
                  },
                  child: Text(LocaleKeys.button_reset),
                ),
              ),
              10.x,
              Expanded(
                child: BottomButton(
                  onPressed: () {
                    Get.back(
                      result: filter,
                    );
                  },
                  child: Text(LocaleKeys.button_apply_filter),
                ),
              )
            ],
          ).paddingAll(10),
        );
      },
    );
  }
}