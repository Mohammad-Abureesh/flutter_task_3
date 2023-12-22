import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/explore/widgets/filter_products_sheet.dart';

import '/core/domain/entities/product.dart';
import '/core/domain/mixins/search_mixin.dart';
import '/core/domain/repositories/products_repository.dart';
import '/core/extensions/string_ext.dart';

class SearchScreenController with SearchMixin, ChangeNotifier {
  SearchScreenController() : _repository = ProductsRepository();

  List<Product>? products;

  RangeValues? rangeValues;

  final ProductsRepository _repository;

  final Debounce _searchDebounce = Debounce();

  bool loading = false;

  @override
  void search(String? query) {
    products = [];

    if (query.isNullOrEmpty) {
      products = null;
      notifyListeners();
      return;
    }

    // query = query!.toLowerCase();
    _searchDebounce.run(() async {
      await _loadSearchData('title=$query');
    });
  }

  Future _loadSearchData(String query) async {
    _loading = true;
    products = await _repository.productsByQuery(query);
    _loading = false;
    notifyListeners();
  }

  String get _rangQuery {
    return 'price_min=${rangeValues?.start}&price_max=${rangeValues?.end}';
  }

  set _loading(bool v) {
    loading = v;
    notifyListeners();
  }

  void openFilter(BuildContext context) async {
    await showModalBottomSheet(
        context: context,
        builder: (_) {
          return FilterProductsSheet(
            onChanged: onChangeRange,
          );
        }).then((value) {
      _loadSearchData(_rangQuery);
    });
  }

  void onChangeRange(RangeValues? values) {
    rangeValues = values;
  }
}

class Debounce {
  final int milliseconds;

  Timer? _timer;

  Debounce({this.milliseconds = 800});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
