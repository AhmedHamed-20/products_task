import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:products_task/features/Products/model/products_model.dart';

import '../shared_test_data.dart';

void main() {
  group('products model test', () {
    test('test products model from map', () {
      final ProductsModel tProudctsModel =
          ProductsModel.fromMap(tProductsMapList[0]);
      expect(tProudctsModel.id, tProductsMapList[0]['id']);
      expect(tProudctsModel.productName, tProductsMapList[0]['productName']);
      expect(tProudctsModel.productPrice, tProductsMapList[0]['productPrice']);
      expect(tProudctsModel.productImage, tProductsMapList[0]['productImage']);
    });
  });
}
