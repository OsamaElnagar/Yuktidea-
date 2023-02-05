import 'package:yuktidea_auth_flow/models/login_model.dart';

class YuktUserModel {
  late bool status;
  late String message;
  late Data data;

  YuktUserModel(
      {required this.status, required this.message, required this.data});

  YuktUserModel.fromJson1(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);

  }

  factory YuktUserModel.fromJson(Map<dynamic, dynamic> json) =>YuktUserModel(
      status: json['status'],
      message: json['message'],
      data: Data.fromJson(json['data'])
  );


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  late String name;
  late String email;
  late String phone;
  late String role;
  late String avatar;
  late String phone_verified_at;
  late String created_at;
  late String updated_at;





  Data.fromJson(List<dynamic> json) {
name = json[0]['name'];
email = json[0]['email'];
phone = json[0]['phone'];
role = json[0]['role'];
avatar = json[0]['avatar'];
phone_verified_at = json[0]['phone_verified_at'];
created_at = json[0]['created_at'];
updated_at = json[0]['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};

    return data;
  }
}
