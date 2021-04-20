class Car {
  int id;
  String price;
  String currency;
  String carName;
  String company;
  String engine;
  int horsepower;
  int maxSpeed;
  int year;
  String description;
  List<Images> imagesList;

  Car(
      {this.id,
      this.price,
      this.currency,
      this.carName,
      this.company,
      this.engine,
      this.horsepower,
      this.maxSpeed,
      this.year,
      this.description,
      this.imagesList});

  Car.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    currency = json['currency'];
    carName = json['carName'];
    company = json['company'];
    engine = json['engine'];
    horsepower = json['horsepower'];
    maxSpeed = json['maxSpeed'];
    year = json['year'];
    description = json['description'];
    if (json['images'] != null) {
      imagesList = new List<Images>();
      json['images'].forEach((v) {
        imagesList.add(new Images.fromJson(v));
      });
    }
  }

  List<Car> carListFromJson(List<dynamic> dynamicList){
    List<Car> tempCarList = [];
    dynamicList.forEach((element) {
      tempCarList.add(Car.fromJson(element));
    });
    return tempCarList;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['currency'] = this.currency;
    data['carName'] = this.carName;
    data['company'] = this.company;
    data['engine'] = this.engine;
    data['horsepower'] = this.horsepower;
    data['maxSpeed'] = this.maxSpeed;
    data['year'] = this.year;
    data['description'] = this.description;
    if (this.imagesList != null) {
      data['images'] = this.imagesList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String image;

  Images({this.image});

  Images.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }
}
