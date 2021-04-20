import 'package:flutter/material.dart';
import 'package:flutter_mvc/controllers/home_controller.dart';
import 'package:flutter_mvc/custom_widgets/car_item.dart';
import 'package:flutter_mvc/models/car_model.dart';
import 'package:flutter_mvc/server/api_client.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _scrollView(context),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: _title(context),
      centerTitle: true,
    );
  }

  Widget _scrollView(BuildContext context) {
    return _allCars();
  }

  Widget _allCars() {
    return Obx(() {
      if (_homeController.loading.value == true) {
        return Center(child: CircularProgressIndicator());
      } else {
        return ListView.separated(
          itemBuilder: (BuildContext _, int index) {
            Car _tempCar = _homeController.listAllCars[index];
            return CarItem(_tempCar);
          },
          itemCount: _homeController.listAllCars.value.length,
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) {
            return Divider(
              thickness: 1.0,
              height: 0.0,
            );
          },
        );
      }
    });
  }



  Text _title(BuildContext context) {
    return Text(
      '${widget.title}',
      style: TextStyle(color: Colors.white, fontSize: 16.0),
    );
  }
}
