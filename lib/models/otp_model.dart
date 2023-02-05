class OTPModel {
  late bool status;
  late String message;
  late Data data;

  OTPModel(
      {required this.status, required this.message, required this.data});


  factory OTPModel.fromJson(Map<dynamic, dynamic> json) =>OTPModel(
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
  late String phone;
  late String phone_verified_at;

  Data.fromJson(List<dynamic> json) {
    phone = json[0]['access_token'];
    phone_verified_at = json[0]['token_type'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['phone'] = phone;
    data['token_type'] = phone_verified_at;

    return data;
  }
}
