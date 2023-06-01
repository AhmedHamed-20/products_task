import 'package:flutter/foundation.dart';
import 'package:products_task/core/constants/params.dart';
import 'package:products_task/features/Products/model/products_model.dart';
import 'package:products_task/features/Products/repository/base/base_products_repository.dart';

import '../../../core/utls/utls.dart';

class ProductsProvider extends ChangeNotifier {
  final BaseProductsRepository _baseProductsRepository;
  String _errorMessage = '';
  late List<ProductsModel> _productsList;
  RequestStatusWithoutIdle _initDataBaseRequestStatus =
      RequestStatusWithoutIdle.loading;
  RequestStatusWithoutIdle _getAlldataFromDatabaseRequestStatus =
      RequestStatusWithoutIdle.loading;

  //getters
  List<ProductsModel> get productsList => _productsList;
  get errorMessage => _errorMessage;
  get initDatabaseRequestStatus => _initDataBaseRequestStatus;
  get getAllDataFromDatabaseRequestStatus =>
      _getAlldataFromDatabaseRequestStatus;
  ProductsProvider(this._baseProductsRepository);

  Future<void> initDataBase(InitDatabaseParams params) async {
    final result = await _baseProductsRepository.initDataBase(params);
    result.fold((l) {
      _errorMessage = l.message;
      _initDataBaseRequestStatus = RequestStatusWithoutIdle.error;
      notifyListeners();
    }, (r) {
      _initDataBaseRequestStatus = RequestStatusWithoutIdle.success;
      notifyListeners();
    });
  }

  Future<void> getAllProducts(GetAllProductsParams params) async {
    final result = await _baseProductsRepository.getAllProducts(params);
    result.fold((l) {
      _errorMessage = l.message;
      _getAlldataFromDatabaseRequestStatus = RequestStatusWithoutIdle.error;
      notifyListeners();
    }, (r) {
      _productsList = r;
      _getAlldataFromDatabaseRequestStatus = RequestStatusWithoutIdle.success;
      notifyListeners();
    });
  }
}
