import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:products_task/core/error/failure.dart';
import 'package:products_task/features/Products/data/base/base_local_products_data_source.dart';
import 'package:products_task/features/Products/model/products_model.dart';
import 'package:products_task/features/Products/repository/impl/products_repository_impl.dart';

import '../../shared_test_data.dart';
import 'products_repository_impl_test.mocks.dart';

@GenerateMocks([BaseLocalProductsDataSource])
void main() {
  late BaseLocalProductsDataSource baseLocalProductsDataSource;
  late ProductsRepositoryImpl productsRepositoryImpl;
  setUp(() {
    baseLocalProductsDataSource = MockBaseLocalProductsDataSource();
    productsRepositoryImpl =
        ProductsRepositoryImpl(baseLocalProductsDataSource);
  });
  group('products repository test', () {
    test('initDataBase should return failure when throw app database exception',
        () async {
      // arrange
      when(baseLocalProductsDataSource.initDataBase(tInitDatabaseParams))
          .thenThrow(tAppDatabaseException);
      // act
      final result =
          (await productsRepositoryImpl.initDataBase(tInitDatabaseParams))
              .fold((l) => l, (r) => null);
      // assert
      expect(result, isA<Failure>());
      verify(baseLocalProductsDataSource.initDataBase(tInitDatabaseParams))
          .called(1);
    });

    test('insertProduct should return int on success', () async {
      // arrange
      when(
        baseLocalProductsDataSource.insertProduct(tInsertProductParams),
      ).thenAnswer((_) async => 1);
      // act
      final result =
          (await productsRepositoryImpl.insertProduct(tInsertProductParams))
              .fold((l) => null, (r) => r);
      // assert
      expect(result, 1);
      verify(
        baseLocalProductsDataSource.insertProduct(tInsertProductParams),
      ).called(1);
    });
    test(
        'insertProduct should return failure when throw app database exception',
        () async {
      // arrange
      when(
        baseLocalProductsDataSource.insertProduct(tInsertProductParams),
      ).thenThrow(tAppDatabaseException);
      // act
      final result =
          (await productsRepositoryImpl.insertProduct(tInsertProductParams))
              .fold((l) => l, (r) => null);
      // assert
      expect(result, isA<Failure>());
      verify(
        baseLocalProductsDataSource.insertProduct(tInsertProductParams),
      ).called(1);
    });
    test('getAllProducts should return list<ProductsModel> on success',
        () async {
      // arrange
      when(baseLocalProductsDataSource.getAllProducts(tGetAllProductsParams))
          .thenAnswer((realInvocation) async => tProductsList);
      // act
      final result =
          (await productsRepositoryImpl.getAllProducts(tGetAllProductsParams))
              .fold((l) => null, (r) => r);
      // assert
      expect(result, isA<List<ProductsModel>>());
      verify(
        baseLocalProductsDataSource.getAllProducts(tGetAllProductsParams),
      ).called(1);
    });
    test(
        'getAllProducts should return failure when throw app database exception',
        () async {
      // arrange
      when(baseLocalProductsDataSource.getAllProducts(tGetAllProductsParams))
          .thenThrow(tAppDatabaseException);
      // act
      final result =
          (await productsRepositoryImpl.getAllProducts(tGetAllProductsParams))
              .fold((l) => l, (r) => null);
      // assert
      expect(result, isA<Failure>());
      verify(
        baseLocalProductsDataSource.getAllProducts(tGetAllProductsParams),
      ).called(1);
    });

    test('updateProduct should return int on success', () async {
      // arrange
      when(
        baseLocalProductsDataSource.updateProduct(tUpdateProductParams),
      ).thenAnswer((_) async => 1);
      // act
      final result =
          (await productsRepositoryImpl.updateProduct(tUpdateProductParams))
              .fold((l) => null, (r) => r);
      // assert
      expect(result, 1);
      verify(
        baseLocalProductsDataSource.updateProduct(tUpdateProductParams),
      ).called(1);
    });
    test(
        'updateProduct should return failure when throw app database exception',
        () async {
      // arrange
      when(
        baseLocalProductsDataSource.updateProduct(tUpdateProductParams),
      ).thenThrow(tAppDatabaseException);
      // act
      final result =
          (await productsRepositoryImpl.updateProduct(tUpdateProductParams))
              .fold((l) => l, (r) => null);
      // assert
      expect(result, isA<Failure>());
      verify(
        baseLocalProductsDataSource.updateProduct(tUpdateProductParams),
      ).called(1);
    });

    test('deleteProduct should return int on success', () async {
      // arrange
      when(
        baseLocalProductsDataSource.deleteProduct(tDeleteProductParams),
      ).thenAnswer((_) async => 1);
      // act
      final result =
          (await productsRepositoryImpl.deleteProduct(tDeleteProductParams))
              .fold((l) => null, (r) => r);
      // assert
      expect(result, 1);
      verify(
        baseLocalProductsDataSource.deleteProduct(tDeleteProductParams),
      ).called(1);
    });
    test(
        'deleteProduct should return failure when throw app database exception',
        () async {
      // arrange
      when(
        baseLocalProductsDataSource.deleteProduct(tDeleteProductParams),
      ).thenThrow(tAppDatabaseException);
      // act
      final result =
          (await productsRepositoryImpl.deleteProduct(tDeleteProductParams))
              .fold((l) => l, (r) => null);
      // assert
      expect(result, isA<Failure>());
      verify(
        baseLocalProductsDataSource.deleteProduct(tDeleteProductParams),
      ).called(1);
    });
  });
}
