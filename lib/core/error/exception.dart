import 'error_message_model.dart';

class AppDatabaseException implements Exception {
  final LocalErrorsMessageModel dataBaseErrorMessageModel;

  const AppDatabaseException(this.dataBaseErrorMessageModel);
}
