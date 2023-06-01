import 'package:flutter/foundation.dart';
import 'package:products_task/core/constants/params.dart';
import 'package:products_task/features/Products/repository/base/base_products_repository.dart';

import '../../../core/utls/utls.dart';

class ProductsProvider extends ChangeNotifier {
  final BaseProductsRepository _baseProductsRepository;
  String _errorMessage = '';
  late RequestStatusWithoutIdle _requestStatus;
  get errorMessage => _errorMessage;
  get requestStatus => _requestStatus;
  ProductsProvider(this._baseProductsRepository);

  Future<void> initDataBase(InitDatabaseParams params) async {
    _requestStatus = RequestStatusWithoutIdle.loading;
    notifyListeners();
    final result = await _baseProductsRepository.initDataBase(params);
    result.fold((l) {
      _errorMessage = l.message;
      _requestStatus = RequestStatusWithoutIdle.error;
      notifyListeners();
    }, (r) {
      _requestStatus = RequestStatusWithoutIdle.success;
      notifyListeners();
    });
  }
}
