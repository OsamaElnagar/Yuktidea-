class OTPResendModel {
  late bool status;
  late String message;
  late Data data;

  OTPResendModel(
      {required this.status, required this.message, required this.data});


  factory OTPResendModel.fromJson(Map<dynamic, dynamic> json) =>OTPResendModel(
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

  Data.fromJson(List<dynamic> json) {
    phone = json[0]['phone'];

  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['phone'] = phone;
    return data;
  }
}
