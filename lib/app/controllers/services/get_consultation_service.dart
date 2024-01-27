import 'package:http/http.dart'as http;
import 'package:jora_test_app/app/utilis/api_config.dart';

class ConsultationService {
  static Future<http.Response> getListOfUsers() async {
    http.Response res = await http.get(
      Uri.parse(
          '${ApiConfig.baseUrl}${ApiConfig.listOfCoin}'), // change this
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      // body: signUpRequestToJson(req),
    );

    print("Auth:${res.body}");
      print("status:${res.statusCode}");
       print("all:${res.headers}  tt   ${res.reasonPhrase}");
    return res;
  }}