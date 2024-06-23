import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:translator/Model/constants.dart';
import 'package:http/http.dart' as http;

class TranslateApiHandler {
  static Future<String> translateMessage(String message , String language1 , String language2) async {
    try {
      var url = Uri.parse(Constants.baseUrl);
      final response = await http.post(
        url,
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String> {
          'langFrom': language1,
          'langTo': language2,
          'msg': message,
        }),
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse['msg'];
      }
      return "Something went wrong";
    } catch (err) {
      debugPrint(err.toString());
      return "Internal Server error";
    }
  }
}