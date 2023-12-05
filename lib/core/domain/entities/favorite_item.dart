import 'package:flutter_task_3/core/enums/e_favorite_type.dart';

class FavoriteItem {
  final int id;
  final EFavoriteType type;

  FavoriteItem.product(this.id) : type = EFavoriteType.product;
}
