import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moderator_app/app/constants/index.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/services/index.dart';
import 'package:moderator_app/app/services/information_service.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/widgets/index.dart';

class ReportFilter extends ValueListenable {
  List<ReportStatus> statuses = [];
  Sector? sector;
  List<ReportType> types = [];
  List<Area> provinces = [];
  DateTimeRange? dateRange;

  DateTimeRange? get defaultRange {
    return dateRange;
    final informationService = Get.find<InformationService>();
    return dateRange ??
        DateTimeRange(
          start: informationService.reportFilterOption.value!.minDate,
          end: DateTime.now(),
        );
  }

  bool get hasFilter => statuses.isNotEmpty || sector != null || types.isNotEmpty || dateRange != null || provinces.isNotEmpty;

  Map<String, dynamic> get requestBody {
    Map<String, dynamic> body = {};
    if (sector != null) {
      body['sector_ids'] = [sector!.id];
    }
    if (types.isNotEmpty) {
      body['report_type_ids'] = types.map((e) => e.id).toList();
    }
    if (statuses.isNotEmpty) {
      body['status_ids'] = statuses.map((e) => e.id).toList();
    }
    if (provinces.isNotEmpty) {
      body['area_ids'] = provinces.map((e) => e.id).toList();
    }
    if (dateRange != null) {
      body['date_range'] = [dateRange!.start.toIso8601String(), dateRange!.end.toIso8601String()];
    }
    return body;
  }

  ReportFilter clone() {
    return ReportFilter()
      ..statuses = List.from(statuses)
      ..sector = sector
      ..types = List.from(types)
      ..provinces = List.from(provinces)
      ..dateRange = dateRange;
  }

  update(VoidCallback callback) {
    callback();
    notifyListener();
  }

  void apply(ReportFilter filter) {
    statuses = filter.statuses;
    sector = filter.sector;
    types = filter.types;
    provinces = filter.provinces;
    dateRange = filter.dateRange;
    notifyListener();
  }

  void reset() {
    statuses = [];
    sector = null;
    types = [];
    provinces = [];
    dateRange = null;
    notifyListener();
  }

  PreferredSizeWidget display({
    VoidCallback? onTap,
  }) =>
      PreferredSize(
        preferredSize: Size(
          Get.width,
          hasFilter ? kToolbarHeight : 0,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Builder(
            builder: (context) {
              if (hasFilter) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(
                          left: AppDimens.marginHorizontal,
                          right: AppDimens.marginHorizontal / 2,
                        ),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (statuses.isNotEmpty)
                              Pill(
                                text: statuses.map((e) => e.name).join(' | '),
                                onTap: onTap,
                                color: statuses.length == 1 && statuses.first.color != null ? AppColors.fromHex(statuses.first.color!) : AppColors.primaryColor,
                                onClose: () {
                                  statuses.clear();
                                  notifyListener();
                                },
                              ).marginOnly(right: AppDimens.marginHorizontal / 2),
                            if (sector != null && types.isNotEmpty)
                              Pill(
                                text: "${sector!.name} : ${types.map((e) => e.name).join(' | ')}",
                                onTap: onTap,
                                onClose: () {
                                  sector = null;
                                  types.clear();
                                  notifyListener();
                                },
                              ).marginOnly(right: AppDimens.marginHorizontal / 2)
                            else ...[
                              if (sector != null)
                                Pill(
                                  text: sector!.name,
                                  onTap: onTap,
                                  onClose: () {
                                    sector = null;
                                    notifyListener();
                                  },
                                ).marginOnly(right: AppDimens.marginHorizontal / 2),
                              if (types.isNotEmpty)
                                Pill(
                                  text: types.map((e) => e.name).join(' | '),
                                  onTap: onTap,
                                  onClose: () {
                                    types.clear();
                                    notifyListener();
                                  },
                                ).marginOnly(right: AppDimens.marginHorizontal / 2),
                            ],
                            if (provinces.isNotEmpty)
                              Pill(
                                onTap: onTap,
                                text: provinces.map((e) => e.name).join(' | '),
                                onClose: () {
                                  provinces.clear();
                                  notifyListener();
                                },
                              ).marginOnly(right: AppDimens.marginHorizontal / 2),
                            if (dateRange != null)
                              Pill(
                                text: '${formatShortDate(dateRange!.start)} - ${formatShortDate(dateRange!.end)}',
                                onTap: onTap,
                                onClose: () {
                                  dateRange = null;
                                  notifyListener();
                                },
                              ).marginOnly(right: AppDimens.marginHorizontal / 2),
                          ],
                        ).paddingOnly(
                          bottom: 12,
                        ),
                      ),
                    ),
                    SmallIconButton(
                      icon: AppIcons.close,
                      color: Colors.black,
                      onPressed: () {
                        reset();
                      },
                    ).marginOnly(
                      bottom: 8,
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      );

  notifyListener() {
    for (final listener in listeners) {
      listener();
    }
  }

  List<VoidCallback> listeners = [];

  @override
  void addListener(VoidCallback listener) {
    listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    listeners.remove(listener);
  }

  @override
  get value => this;
}
