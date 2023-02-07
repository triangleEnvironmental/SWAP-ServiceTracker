import 'package:moderator_app/locales/index.dart';

class Validation {
  static require(String label) {
    return (String? input) {
      if (input == null || input.isEmpty) {
        return LocaleKeys.validation_required({
          'name': label,
        });
      }
      return null;
    };
  }

  static combine(String label, List<String? Function(String? input) Function(String label)> validations) {
    final allValidations = validations.map((e) => e(label)).toList();
    return (String? input) {
      for (var validation in allValidations) {
        final result = validation(input);
        if (result != null) {
          return result;
        }
      }
      return null;
    };
  }
}
