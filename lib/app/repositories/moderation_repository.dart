import 'package:moderator_app/app/repositories/repository.dart';
import 'package:moderator_app/app/utils/index.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/constants/index.dart';

class ModerationRepository extends Repository {
  Future<Pagination> listModerationHistory({
    required int page,
  }) async {
    try {
      return await getPagination(
        listModerationHistoryEndPoint,
        body: {
          'page': page,
        },
      );
    } catch (e) {
      throw getErrorMessage(e);
    }
  }
}
