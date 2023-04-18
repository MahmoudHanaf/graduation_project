class UserData {
  String? user_id;
  String? user_name;
  String? user_email;
  String? user_password;
  String? user_phone;
  String? user_token;
  String? user_image;

  UserData();

  UserData.fromJson(Map<String, dynamic> data) {
    user_id = data['user_id'];
    user_name = data['user_name'];
    user_email = data['user_email'];
    user_password = data['user_password'];
    user_phone = data['user_phone'];
    user_token = data['user_token'];
    user_image = data['user_image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': user_id,
      'user_name': user_name,
      'user_email': user_email,
      'user_password': user_password,
      'user_phone': user_phone,
      'user_token': user_token,
      'user_image': user_image,
    };
  }
}