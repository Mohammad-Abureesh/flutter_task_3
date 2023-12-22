part of apis_manager;

class ApiTokenService {
  static void addTokenToDioOptions() {
    ApisManager._dio.options.headers = {
      'Authorization': 'Bearer ${StorageUtils.storage.getString('token')}'
    };
  }
}
