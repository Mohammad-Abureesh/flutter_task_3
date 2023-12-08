import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/cart/controllers/check_out_screen_controller.dart';
import 'package:flutter_task_3/app/cart/widgets/user_address_details.dart';
import 'package:flutter_task_3/app/dashboard/widgets/product_details_card.dart';
import 'package:flutter_task_3/core/enums/e_payment_method.dart';
import 'package:flutter_task_3/core/presentation/widgets/submit_button.dart';
import 'package:flutter_task_3/core/presentation/widgets/text_widget.dart';

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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _Section(
                      title: 'Your address',
                      actionText: 'Change address',
                      child: UserAddressDetails(
                          address: widget._controller.address,
                          name: widget._controller.username)),
                  _Section(
                      title: 'Shipping Mode',
                      actionText: 'Change mode',
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(data: widget._controller.shippingMode),
                            const TextWidget(data: '\$20'),
                          ],
                        ),
                      )),
                  _Section(
                      title: 'Your cart',
                      actionText: 'View All',
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: widget._controller.items
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Container(
                                        width: 100.0,
                                        height: 100.0,
                                        decoration:
                                            ProductCardDecoration.fromProduct(
                                                e),
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      )),
                  _Section(
                      title: 'Payment Method',
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: EPaymentMethod.values
                              .map((e) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            backgroundColor:
                                                Colors.grey.shade300),
                                        onPressed: () {},
                                        child: Icon(e.icon)),
                                  ))
                              .toList(),
                        ),
                      )),
                  _Section(
                      title: 'Order Summary',
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.color ??
                                    Colors.grey)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                                data:
                                    'Order date ${DateTime.now().toIso8601String()}'),
                            const TextWidget(data: 'Progress '),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          ),
          _PayNow(widget._controller.total,
              () => widget._controller.payNow(context)),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;

  final String? actionText;
  final VoidCallback? onActionTap;

  final Widget child;

  const _Section(
      {super.key,
      required this.title,
      this.actionText,
      this.onActionTap,
      required this.child});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [TextWidget.bold(data: title)];

    if (actionText != null) {
      children.add(TextButton(
          onPressed: onActionTap,
          child: TextWidget(
              data: actionText!, color: Theme.of(context).hintColor)));
    }

    return Column(children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children),
      const SizedBox(height: 8.0),
      child
    ]);
  }
}

class _PayNow extends StatelessWidget {
  final double total;
  final VoidCallback payNow;

  const _PayNow(this.total, this.payNow);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextWidget.bold(data: 'Coupon'),
            TextWidget(
                data: 'Add Coupon >', color: Theme.of(context).hintColor),
          ],
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const TextWidget(data: 'Total', size: 10.0),
              TextWidget.bold(data: '\$$total'),
            ]),
            SizedBox(
                width: 100,
                child: SubmitButton(title: 'Pay Now', onPressed: payNow)),
          ],
        ),
      ],
    );
  }
}
