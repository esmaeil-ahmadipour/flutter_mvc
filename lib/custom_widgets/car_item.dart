import 'package:flutter/material.dart';
import 'package:flutter_mvc/models/car_model.dart';
import 'package:flutter_mvc/server/api_client.dart';
import 'package:flutter_mvc/views/details.dart';
import 'package:get/get.dart';

class CarItem extends StatelessWidget {
  final Car tempCar;


  CarItem(this.tempCar);

  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap: () {
        Get.to(() => CarDetails(car: tempCar,title: 'Car Catalog Information',));
        },
      contentPadding: const EdgeInsets.all(8.0),
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${tempCar.company}'),
              Text('${tempCar.carName}'),
            ],
          ),
          Spacer(),
          Stack(
            children: [
              Container(
                height: 82,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(
                          ApiClient.URL + tempCar.imagesList[0].image),
                      fit: BoxFit.fill),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).primaryColor, spreadRadius: 3),
                  ],
                ),
              ),
              Positioned(
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text(
                    '${tempCar.id}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                top: 2,
                right: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
