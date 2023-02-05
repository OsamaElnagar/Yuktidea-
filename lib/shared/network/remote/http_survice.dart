import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../components/components.dart';
import '../../components/strings.dart';
import '../end_points.dart';

class HttpHelper {
  static registerYukt({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String passwordConfirmation,
  }) async {
    var request = http.Request('POST', Uri.parse(baseUrl + register));
    request.body = '''{\n 
       "name" : $name,\n 
          "email" : $email,\n 
             "phone" : $phone,\n  
               "password" : $password,\n  
                 "password_confirmation" : $passwordConfirmation\n
                 }''';

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static  loginYukt({
    required String email,
    required String password,
  }) async {
    var request = http.Request('POST', Uri.parse(baseUrl + login));
    request.body = '''{\n  
      "login" :"$email",\n   
     "password" : "$password"\n
     }''';

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }

  }

  static refreshJWTYukt() async{
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $jwtToken'
    };
    var request = http.Request('GET', Uri.parse(baseUrl + refreshToken));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //String refreshedJWT = await response.stream;

      print(await response.stream.bytesToString());
    }
    else {
    print(response.reasonPhrase);
    }
  }

  static otpSendVerify({required String jwtToken}) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $jwtToken'
    };
    var request = http.Request('POST', Uri.parse(baseUrl));
    request.body = '''{\n    "otp" : "6533"\n}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      pint(await response.stream.bytesToString());
    } else {
      pint(response.reasonPhrase.toString());
    }
  }
}
