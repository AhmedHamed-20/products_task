import 'package:flutter/material.dart';
import 'package:products_task/core/routes/app_routes_names.dart';
import 'package:products_task/core/services/service_locator.dart';
import 'package:products_task/features/Products/view/screens/add_product_screen.dart';
import 'package:products_task/features/Products/view/screens/products_screen.dart';
import 'package:products_task/features/Products/view_model/add_product_view_model.dart';
import 'package:provider/provider.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.home:
        return MaterialPageRoute(builder: (_) => const ProductsScreen());
      case AppRoutesNames.addProduct:
        return MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (context) => serviceLocator<AddProductProvider>(),
            child: const AddProductScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('No route found'),
            ),
          ),
        );
    }
  }
}
