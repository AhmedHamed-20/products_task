import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:products_task/core/services/service_locator.dart';
import 'package:provider/provider.dart';

import 'core/constants/app_strings.dart';
import 'core/constants/params.dart';
import 'core/database/datebase_queries.dart';
import 'core/routes/app_router.dart';
import 'core/routes/app_routes_names.dart';
import 'features/Products/view_model/get_products_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => serviceLocator<GetProductsProvider>()
        ..initDataBase(
          const InitDatabaseParams(
            databasesName: AppStrings.products,
            query: DatebaseQueries.createTableQuery,
            version: 1,
          ),
        ),
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: AppRouter().onGenerateRoute,
          initialRoute: AppRoutesNames.home,
        ),
      ),
    );
  }
}
