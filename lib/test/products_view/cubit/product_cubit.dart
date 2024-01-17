import 'package:bloc/bloc.dart';
import 'package:flutter_task_3/core/domain/entities/product.dart';
import 'package:flutter_task_3/core/domain/gateway/products_gateway.dart';
import 'package:flutter_task_3/core/utils/storage_utils.dart';
import 'package:flutter_task_3/test/products_view/cubit/products_states.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit()
      : products = [],
        super(InitState());

  List<Product> products;

  void init() async {
    emit(WaitingState());
    await _intiProducts();
    emit(SuccessState());
  }

  Future<void> _intiProducts() async {
    products = await ProductsGateway().products();
  }

  void saveOrRemove(Product product) {
    (product.inFavorites()
            ? product.removeFromFavorites
            : product.saveAsFavorite)
        .call();
    emit(SuccessState());
  }
}

extension ProductExt on Product {
  String get _favKey => 'p$id';
  void saveAsFavorite() async {
    StorageUtils.storage.setInt(_favKey, id);
  }

  bool inFavorites() {
    return StorageUtils.storage.containsKey(_favKey);
  }

  void removeFromFavorites() async {
    await StorageUtils.storage.remove(_favKey);
  }
}
