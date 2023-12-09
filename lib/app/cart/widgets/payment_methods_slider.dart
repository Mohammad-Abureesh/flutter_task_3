import 'package:flutter/material.dart';
import 'package:flutter_task_3/core/enums/e_payment_method.dart';

class PaymentMethodsSlider extends StatefulWidget {
  final ValueChanged<EPaymentMethod>? onChanged;
  final EPaymentMethod? initialMethod;

  const PaymentMethodsSlider({Key? key, this.onChanged, this.initialMethod})
      : super(key: key);

  @override
  State<PaymentMethodsSlider> createState() => _PaymentMethodsSliderState();
}

class _PaymentMethodsSliderState extends State<PaymentMethodsSlider> {
  late ValueNotifier<EPaymentMethod?> activeMethodNotifier;

  @override
  void initState() {
    super.initState();
    activeMethodNotifier = ValueNotifier(widget.initialMethod);
  }

  void _onChanged(EPaymentMethod method) {
    widget.onChanged?.call(method);
    activeMethodNotifier.value = method;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: activeMethodNotifier,
      builder: (context, value, _) => SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: EPaymentMethod.allowedMethods
                  .map((method) => _ItemBuilder(
                      method: method,
                      selected: method == value,
                      onPressed: () => _onChanged(method)))
                  .toList())),
    );
  }
}

class _ItemBuilder extends StatelessWidget {
  final EPaymentMethod method;
  final bool selected;

  final VoidCallback onPressed;
  const _ItemBuilder({
    required this.method,
    required this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    Color background;
    Color iconColor;
    Color primary = Theme.of(context).primaryColor;
    double opacity = 0.65;
    Size? size;

    if (selected) {
      opacity = 1.0;
      background = primary;
      iconColor = Colors.grey.shade300;
    } else {
      background = Colors.grey.shade300;
      iconColor = primary;
      size = const Size(55.0, 30.0);
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Opacity(
        opacity: opacity,
        child: TextButton(
            style: ElevatedButton.styleFrom(
                minimumSize: size,
                maximumSize: size,
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                backgroundColor: background),
            onPressed: onPressed,
            child: Center(child: Icon(method.icon, color: iconColor))),
      ),
    );
  }
}
