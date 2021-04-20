import 'package:flutter_mvc/models/car_model.dart';
import 'package:flutter_mvc/models/user_model.dart';
import 'package:flutter_mvc/server/api_client.dart';

class AppRepository {
  ApiClient _apiClient;

  AppRepository() {
    _apiClient = new ApiClient();
  }

  Future<User> checkUserInfo(String userName, String password) async {
    User user;
    await _apiClient.dio.get(ApiClient.END_POINT_USERS, queryParameters: {
      "userName": userName,
      "password": password
    }).then((value) {
      user = User.fromJson(value.data[0]);
    }).catchError((error, stackTrace) {});
    return user;
  }

  Future<List<Car>> getAllCars() async {
    List<Car> carList = [];
    await _apiClient.dio.get(ApiClient.END_POINT_CARS).then((value) {
      carList = Car().carListFromJson(value.data['cars']);
    }).catchError((error, stackTrace) {});
    return carList;
  }
}
