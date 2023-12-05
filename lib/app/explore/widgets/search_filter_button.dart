import 'package:flutter/material.dart';

class SearchFilterButton extends StatelessWidget {
  const SearchFilterButton({Key? key, this.onFilter}) : super(key: key);

  final ValueChanged<Map<String, dynamic>>? onFilter;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    const Size size = Size.square(45.0);

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: theme.scaffoldBackgroundColor,
                elevation: 5.0,
                maximumSize: size,
                minimumSize: size,
                padding: const EdgeInsets.all(2.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0))),
            onPressed: _submitFilter,
            child: Icon(Icons.tune, color: theme.primaryColor)));
  }

  void _submitFilter() {
    //todo:add filter implementation
  }
}
