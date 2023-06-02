import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:products_task/core/constants/app_strings.dart';
import 'package:products_task/core/database/base_database_service.dart';
import 'package:products_task/core/database/datebase_queries.dart';
import 'package:products_task/core/error/exception.dart';
import 'package:products_task/features/Products/data/impl/local_products_data_source_impl.dart';
import 'package:products_task/features/Products/model/products_model.dart';

import '../../shared_test_data.dart';
import 'local_products_data_source_impl_test.mocks.dart';

@GenerateMocks([BaseDataBaseService])
void main() {
  late BaseDataBaseService baseDataBaseService;
  late LocalProductsDataSourceImpl localProductsDataSourceImpl;
  setUp(() {
    baseDataBaseService = MockBaseDataBaseService();
    localProductsDataSourceImpl =
        LocalProductsDataSourceImpl(baseDataBaseService);
  });

  group('product local datasource test', () {
    test(
        'initDataBase should return app database exception when throw exception',
        () async {
      // arrange
      when(
        baseDataBaseService.init(
          databasesName: AppStrings.products,
          version: 1,
          query: DatebaseQueries.createTableQuery,
        ),
      ).thenThrow(Exception());
      // act
      call() => localProductsDataSourceImpl.initDataBase(tInitDatabaseParams);
      // assert
      expect(call, throwsA(isA<AppDatabaseException>()));
      verify(
        baseDataBaseService.init(
          databasesName: AppStrings.products,
          version: 1,
          query: DatebaseQueries.createTableQuery,
        ),
      ).called(1);
    });
    test('insertProduct should return int on success', () async {
      // arrange
      when(
        baseDataBaseService.insertIntoDataBase(
          tableName: AppStrings.products,
          data: {
            AppStrings.productName: 'test',
            AppStrings.productPrice: 1,
            AppStrings.productImage: 'test',
          },
        ),
      ).thenAnswer((_) async => 1);
      // act
      final result =
          await localProductsDataSourceImpl.insertProduct(tInsertProductParams);
      // assert
      expect(result, 1);
      verify(
        baseDataBaseService.insertIntoDataBase(
          tableName: AppStrings.products,
          data: {
            AppStrings.productName: 'test',
            AppStrings.productPrice: 1,
            AppStrings.productImage: 'test',
          },
        ),
      ).called(1);
    });
    test(
        'insertProduct should return app database exception when throw exception',
        () async {
      // arrange
      when(
        baseDataBaseService.insertIntoDataBase(
          tableName: AppStrings.products,
          data: {
            AppStrings.productName: 'test',
            AppStrings.productPrice: 1,
            AppStrings.productImage: 'test',
          },
        ),
      ).thenThrow(Exception());
      // act
      call() => localProductsDataSourceImpl.insertProduct(tInsertProductParams);
      // assert
      expect(call, throwsA(isA<AppDatabaseException>()));
      verify(
        baseDataBaseService.insertIntoDataBase(
          tableName: AppStrings.products,
          data: {
            AppStrings.productName: 'test',
            AppStrings.productPrice: 1,
            AppStrings.productImage: 'test',
          },
        ),
      ).called(1);
    });
    test('getAllProducts should return list<ProductsModel> on success',
        () async {
      // arrange
      when(baseDataBaseService.getAllDataFromDatabase(AppStrings.products))
          .thenAnswer((realInvocation) async => tProductsMapList);
      // act
      final result = await localProductsDataSourceImpl
          .getAllProducts(tGetAllProductsParams);
      // assert
      expect(result, isA<List<ProductsModel>>());
      verify(
        baseDataBaseService.getAllDataFromDatabase(AppStrings.products),
      ).called(1);
    });

    test(
        'getAllProducts should return app database exception when throw exception',
        () async {
      // arrange
      when(baseDataBaseService.getAllDataFromDatabase(AppStrings.products))
          .thenThrow(Exception());
      // act
      result() =>
          localProductsDataSourceImpl.getAllProducts(tGetAllProductsParams);
      // assert
      expect(result(), throwsA(isA<AppDatabaseException>()));
      verify(
        baseDataBaseService.getAllDataFromDatabase(AppStrings.products),
      ).called(1);
    });

    test('updateProduct should return int on success', () async {
      // arrange
      when(
        baseDataBaseService.updateDataBase(
          'query',
          [
            'test',
            1,
            'test',
            1,
          ],
        ),
      ).thenAnswer((_) async => 1);
      // act
      final result =
          await localProductsDataSourceImpl.updateProduct(tUpdateProductParams);
      // assert
      expect(result, 1);
      verify(
        baseDataBaseService.updateDataBase(
          'query',
          [
            'test',
            1,
            'test',
            1,
          ],
        ),
      ).called(1);
    });
    test(
        'updateProduct should return app database exception when throw exception',
        () async {
      // arrange
      when(
        baseDataBaseService.updateDataBase(
          'query',
          [
            'test',
            1,
            'test',
            1,
          ],
        ),
      ).thenThrow(Exception());
      // act
      result() =>
          localProductsDataSourceImpl.updateProduct(tUpdateProductParams);
      // assert
      expect(result(), throwsA(isA<AppDatabaseException>()));
      verify(
        baseDataBaseService.updateDataBase(
          'query',
          [
            'test',
            1,
            'test',
            1,
          ],
        ),
      ).called(1);
    });

    test('deleteProduct should return int on success', () async {
      // arrange
      when(
        baseDataBaseService.deleteDataFromDatabaseById(
          id: 1,
          tableName: AppStrings.products,
        ),
      ).thenAnswer((_) async => 1);
      // act
      final result =
          await localProductsDataSourceImpl.deleteProduct(tDeleteProductParams);
      // assert
      expect(result, 1);
      verify(
        baseDataBaseService.deleteDataFromDatabaseById(
          id: 1,
          tableName: AppStrings.products,
        ),
      ).called(1);
    });
    test(
        'deleteProduct should return app database exception when throw exception',
        () async {
      // arrange
      when(
        baseDataBaseService.deleteDataFromDatabaseById(
          id: 1,
          tableName: AppStrings.products,
        ),
      ).thenThrow(Exception());
      // act
      result() =>
          localProductsDataSourceImpl.deleteProduct(tDeleteProductParams);
      // assert
      expect(result(), throwsA(isA<AppDatabaseException>()));
      verify(
        baseDataBaseService.deleteDataFromDatabaseById(
          id: 1,
          tableName: AppStrings.products,
        ),
      ).called(1);
    });
  });
}
