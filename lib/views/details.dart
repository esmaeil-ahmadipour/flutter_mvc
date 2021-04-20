import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvc/controllers/home_controller.dart';
import 'package:flutter_mvc/models/car_model.dart';
import 'package:flutter_mvc/server/api_client.dart';
import 'package:get/get.dart';

class CarDetails extends StatefulWidget {
  final Car car;
  final String title;

  CarDetails({@required this.car, @required this.title});

  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  HomeController _homeController = Get.put(HomeController());
  List<Widget> imageList = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < widget.car.imagesList.length; ++i) {
      print('${widget.car.maxSpeed}');
      if (i != 0) {
        imageList.add(
          Image(
            fit: BoxFit.fill,
            image: NetworkImage(
                '${ApiClient.URL + widget.car.imagesList[i].image}'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(context),
        body: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _car(context, orientation)
              : _car(context, orientation);
        }));
  }

  Widget _car(context, orientation) {
    return Obx(() {
      if (_homeController.loading.value == true) {
        return Center(child: CircularProgressIndicator());
      } else {
        return SingleChildScrollView(
          child: Column(
            children: [
              orientation == Orientation.portrait
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      height:
                          (MediaQuery.of(context).size.height - 56 - 24) / 2,
                      child: Carousel(
                        dotSize: 4.0,
                        dotColor: Colors.red,
                        indicatorBgPadding: 9.0,
                        autoplay: true,
                        autoplayDuration: Duration(seconds: 3),
                        images: imageList,
                      ),
                    )
                  : Container(
                      height: (MediaQuery.of(context).size.height - 56 - 24),
                      width: MediaQuery.of(context).size.width,
                      child: Carousel(
                        dotSize: 4.0,
                        dotColor: Colors.yellowAccent,
                        indicatorBgPadding: 9.0,
                        autoplay: true,
                        autoplayDuration: Duration(seconds: 3),
                        images: imageList,
                      ),
                    ),
              ListTile(
                title: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Company:\n'
                            'Model:\n'
                            'Year:\n'
                            'Engine:\n'
                            'Price:\n'
                            'Max Speed:\n'
                            'Power:\n'),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${widget.car.company}\n'
                            '${widget.car.carName}\n'
                            '${widget.car.year}\n'
                            '${widget.car.engine}\n'
                            '${widget.car.price} ${widget.car.currency}\n'
                            '${widget.car.maxSpeed} km/h\n'
                            '${widget.car.horsepower} hp\n'),
                      ],
                    ),
                  ],
                ),
                subtitle: Text(
                  'Descriptions:\n\n${widget.car.description}',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  softWrap: true,
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: _title(context),
      centerTitle: true,
    );
  }

  Text _title(BuildContext context) {
    return Text(
      '${widget.title}',
      style: TextStyle(color: Colors.white, fontSize: 16.0),
    );
  }
}
