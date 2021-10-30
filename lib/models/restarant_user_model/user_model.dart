class RestarantUserModel {
  late String name;
  late String email;
  late String phone;
  late String uId;

  String? image;
  String? cover;
  RestarantUserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.uId,
    this.image,
    this.cover,
  });
  RestarantUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    uId = json['uId'];
    image = json['image'];
    cover = json['cover'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'image': image,
      'cover': cover,
    };
  }
}
