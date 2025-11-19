class UserModel {
  String? name;
  String? email;
  int? age ;

  UserModel({ this.name,  this.email,  this.age});

  UserModel.fromJson(Map<dynamic, dynamic> data) {
    name = data['name'];
    email = data['email'];
    age = data['age'];
  }

  toJson() {
    return {'name': name, 'email': email, 'age': age};
  }
}
