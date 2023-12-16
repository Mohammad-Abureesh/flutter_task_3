import 'package:flutter/cupertino.dart';
import 'package:flutter_task_3/core/domain/entities/address.dart';
import 'package:flutter_task_3/core/utils/session.dart';

class ShippingAddressScreenController with ChangeNotifier {
  ShippingAddressScreenController() : addresses = [];
  List<Address> addresses;

  ///Selected shipping address
  Address? selected;

  Future<void> inti() async {
    addresses = Session.user.address;
    notifyListeners();
  }

  void addNewAddress() {}

  void onChangeAddress(Address? value) {
    selected = value;
    notifyListeners();
  }
}
