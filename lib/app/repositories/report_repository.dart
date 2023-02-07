import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moderator_app/app/globals/report_filter.dart';
import 'package:moderator_app/app/repositories/repository.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/constants/index.dart';

class ReportRepository extends Repository {
  Future<ReportFilterOption?> getFilterOptions() async {
    try {
      return await getData<ReportFilterOption>(
        getFilterOptionsEndPoint,
        body: {},
      );
    } catch (e) {
      print('[SILENT ERROR]');
      print(getErrorMessage(e));
      // return handleError(e);
    }
    return null;
  }

  Future<Pagination> listReport({
    int page = 1,
    required ReportFilter filter,
  }) async {
    try {
      return await getPagination(
        listReportEndPoint,
        body: {
          'page': page,
          ...filter.requestBody,
        },
      );
    } catch (e) {
      throw getErrorMessage(e);
    }
  }

  Future<List<ReportMarker>?> mapQuery({
    required LatLngBounds bounds,
    required double zoom,
    required ReportFilter filter,
  }) async {
    try {
      return await getList<ReportMarker>(
        mapQueryEndPoint,
        body: {
          'minLng': bounds.southwest.longitude,
          'minLat': bounds.southwest.latitude,
          'maxLat': bounds.northeast.latitude,
          'maxLng': bounds.northeast.longitude,
          'zoom': zoom.round(),
          ...filter.requestBody,
        },
      );
    } catch (e) {
      return handleError(e);
    }
  }

  Future<Report> detail(int id) async {
    return await getData<Report>(
      reportDetailEndPoint.replaceAll('{id}', '$id'),
      body: {},
    );
  }

  Future<Pagination> listComments({
    required int reportId,
    int page = 1,
  }) async {
    return await getPagination(
      listCommentsEndPoint.replaceAll('{id}', '$reportId'),
      body: {
        'page': page,
      },
    );
  }

  Future<bool?> deleteReport(int reportId) async {
    try {
      final response = await delete(
        deleteReportEndPoint.replaceAll('{id}', '$reportId'),
      );

      if (response.hasError) {
        throw response;
      }

      return true;
    } catch (e) {
      return handleError(e);
    }
  }

  Future<Report?> changeStatus({
    required int reportId,
    required int? statusId,
    required String notificationTitle,
    required String notificationBody,
  }) async {
    try {
      return await postData<Report>(
        changeStatusEndPoint.replaceAll('{id}', '$reportId'),
        body: {
          'status_id': statusId,
          'notification_title': notificationTitle,
          'notification_body': notificationBody,
        },
      );
    } catch (e) {
      return handleError(e);
    }
  }
}
