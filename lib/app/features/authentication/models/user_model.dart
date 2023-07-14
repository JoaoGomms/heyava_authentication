class UserModel {
  final num id;
  final String name;
  final String password;
  final String email;
  final num addressId;

  UserModel(this.id, this.name, this.password, this.email, this.addressId);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'addressId': addressId
    };
    return map;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        num.parse(map['id'].toString()),
        map['name'],
        map['password'],
        map['email'],
        num.parse(map['addressId'].toString()),
      );
}
