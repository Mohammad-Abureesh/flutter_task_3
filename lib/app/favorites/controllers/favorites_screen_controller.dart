import 'package:flutter/cupertino.dart';
import 'package:flutter_task_3/core/domain/entities/product.dart';
import 'package:flutter_task_3/core/domain/mixins/search_mixin.dart';

class FavoritesScreenController with SearchMixin, ChangeNotifier {
  List<Product>? favorites;

  Future<void> init() async {
    //todo:fetch all favorites products
  }

  @override
  void search(String? query) {
    // TODO: implement search
  }
}
