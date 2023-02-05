class YuktLoginModel {
  late bool status;
  late String message;
  late Data data;

  YuktLoginModel(
      {required this.status, required this.message, required this.data});

  YuktLoginModel.fromJson1(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);

  }

  factory YuktLoginModel.fromJson(Map<dynamic, dynamic> json) =>YuktLoginModel(
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
  late String accessToken;
  late String tokenType;
  late int expiresIn;

  Data({required this.accessToken, required this.tokenType, required this.expiresIn});

  Data.fromJson(List<dynamic> json) {
    accessToken = json[0]['access_token'];
    tokenType = json[0]['token_type'];
    expiresIn = json[0]['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    return data;
  }
}
