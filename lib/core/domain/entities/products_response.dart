import 'package:flutter_task_3/core/domain/entities/product.dart';
import 'package:flutter_task_3/core/utils/json_convertor.dart';

class ProductsResponse {
  List<Product?>? _products;
  int? _total;

  ProductsResponse._(this._products, this._total);

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse._(
        JsonConvertor<Product>()
            .nullableIterable(json['products'], Product.fromJson)
            .toList(),
        json['total']);
  }

  int get total => _total ?? 0;

  List<Product> get products => _products?.whereType<Product>().toList() ?? [];
}
