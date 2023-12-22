import 'package:flutter_task_3/core/constants/apis_routes.dart';
import 'package:flutter_task_3/core/domain/entities/category_entity.dart';
import 'package:flutter_task_3/core/domain/gateway/apis_handler/api_response.dart';
import 'package:flutter_task_3/core/domain/gateway/apis_handler/apis_manager.dart';

class CategoriesGateway extends ApisManager {
  Future<ApiResponse<List<CategoryEntity>>> categories() async =>
      getList(ApisRoutes.categories, CategoryEntity.fromJson);
}
