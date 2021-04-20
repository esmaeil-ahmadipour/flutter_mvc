class User {
  int id;
  String userName;
  String password;
  String role;
  String phone;
  String email;
  String image;

  User(
      {this.id,
      this.userName,
      this.password,
      this.role,
      this.phone,
      this.email,
      this.image});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    password = json['password'];
    role = json['role'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['role'] = this.role;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['image'] = this.image;
    return data;
  }
}
