import 'package:flutter_task_3/core/constants/apis_routes.dart';
import 'package:flutter_task_3/core/domain/entities/product.dart';
import 'package:flutter_task_3/core/domain/gateway/apis_handler/apis_manager.dart';

class ProductsGateway extends ApisManager {
  Future<List<Product>> products({String? params}) async {
    String path = ApisRoutes.products;
    if (params != null) path = '$path?$params';
    return getList<Product>(path, Product.fromJson).elementsOrEmpty;
  }
}
