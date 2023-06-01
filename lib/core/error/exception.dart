import 'error_message_model.dart';

class AppDataBaseException implements Exception {
  final LocalErrorsMessageModel dataBaseErrorMessageModel;

  const AppDataBaseException(this.dataBaseErrorMessageModel);
}
