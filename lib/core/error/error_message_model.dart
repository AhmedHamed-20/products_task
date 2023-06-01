import 'package:equatable/equatable.dart';

class LocalErrorsMessageModel extends Equatable {
  final String errorMessage;

  const LocalErrorsMessageModel({required this.errorMessage});

  factory LocalErrorsMessageModel.fromException(Object? error) {
    return LocalErrorsMessageModel(errorMessage: error.toString());
  }
  @override
  List<Object?> get props => [errorMessage];
}
