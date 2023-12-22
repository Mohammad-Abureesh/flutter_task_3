import 'package:flutter_task_3/core/domain/entities/product.dart';
import 'package:flutter_task_3/core/utils/json_convertor.dart';

class ProductsResponse {
  List<Product?>? _products;

  int? _total;

  ProductsResponse(this._products, this._total);

  factory ProductsResponse.fromJson(json) {
    return ProductsResponse(
        JsonConvertor<Product>()
            .nullableIterable(json, Product.fromJson)
            ?.toList(),
        0);
  }

  int get total => _total ?? 0;

  List<Product> get products => _products?.whereType<Product>().toList() ?? [];
}
