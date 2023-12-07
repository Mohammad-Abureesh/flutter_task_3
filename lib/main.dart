import 'package:flutter/material.dart';
import 'package:flutter_task_3/app/root/ecommerce_app.dart';
import 'package:flutter_task_3/core/utils/storage_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtils.ensureInit();
  runApp(const EcommerceApp());
}
