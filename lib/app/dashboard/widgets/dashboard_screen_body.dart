import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/dashboard/widgets/product_details_card.dart';
import 'package:flutter_task_3/core/domain/repositories/products_repository.dart';

class DashboardScreenBody extends StatefulWidget {
  const DashboardScreenBody({Key? key}) : super(key: key);

  @override
  State<DashboardScreenBody> createState() => _DashboardScreenBodyState();
}

class _DashboardScreenBodyState extends State<DashboardScreenBody> {
  bool loading = true;

  final ProductsRepository _repository = ProductsRepository();

  @override
  void initState() {
    super.initState();
    _repository.init().then((value) {
      _updateLoadingState = false;
    });
  }

  set _updateLoadingState(bool value) {
    if (!mounted) return;
    loading = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return const CircularProgressIndicator();

    return ListView.builder(
        itemCount: _repository.products.length,
        itemBuilder: (_, index) =>
            ProductDetailsCard(product: _repository.products.elementAt(index)));
  }
}
