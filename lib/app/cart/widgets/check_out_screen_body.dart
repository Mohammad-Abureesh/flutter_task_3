import 'package:flutter/material.dart';

import '/app/cart/controllers/check_out_screen_controller.dart';
import '/app/cart/widgets/payment_methods_slider.dart';
import '/app/cart/widgets/user_address_details.dart';
import '/app/dashboard/widgets/product_details_card.dart';
import '/core/domain/entities/product.dart';
import '/core/presentation/widgets/text_widget.dart';
import 'check_out_summary_view.dart';
import 'check_out_view_section.dart';
import 'pay_now_card_details.dart';

class CheckOutScreenBody extends StatefulWidget {
  CheckOutScreenBody({Key? key})
      : _controller = CheckOutScreenController(),
        super(key: key);

  final CheckOutScreenController _controller;

  @override
  State<CheckOutScreenBody> createState() => _CheckOutScreenBodyState();
}

class _CheckOutScreenBodyState extends State<CheckOutScreenBody> {
  @override
  void initState() {
    super.initState();

    widget._controller
      ..addListener(() {
        setState(() {});
      })
      ..init();
  }

  @override
  void dispose() {
    widget._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CheckOutViewSection.card(
                      title: 'Your Address',
                      actionText: 'Change address',
                      child: UserAddressDetails(
                          address: widget._controller.address,
                          name: widget._controller.username)),
                  CheckOutViewSection.card(
                      title: 'Shipping Mode',
                      actionText: 'Change mode',
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(data: widget._controller.shippingMode),
                          const TextWidget(data: '\$20'),
                        ],
                      )),
                  const SizedBox(height: 25.0),
                  CheckOutViewSection(
                      title: 'Your Cart',
                      actionText: 'View All',
                      child: _ProductsView(widget._controller.items)),
                  const SizedBox(height: 25.0),
                  const CheckOutViewSection(
                    title: 'Payment Method',
                    child: PaymentMethodsSlider(),
                  ),
                  const CheckOutSummaryView(),
                ],
              ),
            ),
          ),
          PayNowCardDetails(widget._controller.total,
              () => widget._controller.payNow(context)),
        ],
      ),
    );
  }
}

class _ProductsView extends StatelessWidget {
  final List<Product> items;
  const _ProductsView(this.items);

  @override
  Widget build(BuildContext context) {
    const double dimension = 120.0;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: items
            .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        width: dimension,
                        height: dimension,
                        decoration: ProductCardDecoration.fromProduct(e),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
