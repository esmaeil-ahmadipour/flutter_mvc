import 'package:flutter/material.dart';
import 'package:flutter_mvc/models/car_model.dart';
import 'package:flutter_mvc/repository/app_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  RxBool _loading =false.obs;
  RxList listAllCars=[].obs  ;
  List<Car> carList=[];


  AppRepository _appRepository;
  @override
  void onInit() async {
    super.onInit();
    _appRepository = AppRepository();
    getAllCars();
  }

  RxBool get loading => _loading;

  getAllCars(){
    _loading(true);
    _appRepository.getAllCars().then((value) {
      _loading(false);
      listAllCars(value);
    }).catchError((error, stackTrace) {
      _loading(false);
    });
  }
}