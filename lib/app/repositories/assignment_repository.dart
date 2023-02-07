import 'package:moderator_app/app/globals/report_filter.dart';
import 'package:moderator_app/app/repositories/repository.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/constants/index.dart';

class AssignmentRepository extends Repository {
  Future<AssignmentOption> listAssignmentOption(int reportId) async {
    return await getData<AssignmentOption>(
      listAssignmentOptionEndPoint,
      body: {
        'report_id': reportId,
      },
    );
  }

  Future<bool?> assignUser({
    required int reportId,
    int? userId,
  }) async {
    try {
      final response = await post(
        assignUserEndPoint,
        {
          'report_id': reportId,
          'user_id': userId,
        },
      );

      if (response.hasError) {
        throw response;
      }

      return true;
    } catch (e) {
      return handleError(e);
    }
  }

  Future<Pagination> listAssignedReport({
    int page = 1,
    required ReportFilter filter,
  }) async {
    try {
      return await getPagination(
        listAssignedReportEndPoint,
        body: {
          'page': page,
          ...filter.requestBody,
        },
      );
    } catch (e) {
      throw getErrorMessage(e);
    }
  }
}
