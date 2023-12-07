import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/cart/controllers/cart_screen_controller.dart';
import 'package:flutter_task_3/app/cart/widgets/cart_item_card_details.dart';
import 'package:flutter_task_3/core/presentation/widgets/empty_list_view.dart';
import 'package:flutter_task_3/core/presentation/widgets/submit_button.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

import 'total_text_view.dart';

class CartScreenBody extends StatefulWidget {
  const CartScreenBody({Key? key}) : super(key: key);

  @override
  State<CartScreenBody> createState() => _CartScreenBodyState();
}

class _CartScreenBodyState extends State<CartScreenBody> {
  _CartScreenBodyState() : _controller = CartScreenController();

  final CartScreenController _controller;

  @override
  void initState() {
    super.initState();
    _controller
      ..addListener(() {
        setState(() {});
      })
      ..init();
  }

  @override
  Widget build(BuildContext context) {
    const SizedBox gap = SizedBox(height: 10.0);
    return Column(
      children: [
        TextWidget(
            data: '${_controller.value.length} Products',
            color: Theme.of(context).hintColor),
        Expanded(
            child: _controller.value.isEmpty
                ? const EmptyListView()
                : ListView.separated(
                    separatorBuilder: (_, index) => gap,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    itemCount: _controller.value.length,
                    itemBuilder: (_, index) {
                      final item = _controller.value.elementAt(index);
                      return CartItemCard(
                          item: item,
                          findProduct: _controller.finProduct,
                          onAdd: _controller.addProductToCart,
                          onRemove: _controller.removeProduct);
                    })),
        _CheckOutCard(
          _controller.total,
          _controller.subTotal,
          () => _controller.onCheckOut(context),
        )
      ],
    );
  }
}

class _CheckOutCard extends StatelessWidget {
  final double total;
  final double subTotal;

  final VoidCallback onCheckOut;

  const _CheckOutCard(this.total, this.subTotal, this.onCheckOut);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              TotalText(text: 'Sub Total', value: subTotal),
              const Divider(),
              TotalText(text: 'Total', value: total),
            ]),
          ),
          const SizedBox(width: 15.0),
          Expanded(
              child: SubmitButton(
            title: 'Check Out',
            onPressed: onCheckOut,
          ))
        ],
      ),
    );
  }
}
