import 'dart:io';

import 'package:equatable/equatable.dart';

class ProductsModel extends Equatable {
  final String productName;
  final int productPrice;
  final File productImage;
  final int? id;
  const ProductsModel(
      {required this.productName,
      required this.productPrice,
      required this.productImage,
      this.id});

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      productName: map['productName'],
      productPrice: map['productPrice'],
      productImage: map['productImage'],
      id: map['id'],
    );
  }

  Map<String, dynamic> toMap() {
    final imageBytes = productImage.readAsBytesSync();
    return {
      'productName': productName,
      'productPrice': productPrice,
      'productImage': imageBytes,
    };
  }

  @override
  List<Object?> get props => [
        productName,
        productPrice,
        productImage,
        id,
      ];
}
