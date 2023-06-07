import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../constant/api_url.dart';
import '../model/login_model.dart';

class LoginService {
  final String url = "${apiUrl}/login";

  Future<String?> loginUser(var email, var password) async {
    UserModel user = UserModel(email: email, password: password);

    final response = await Dio().post(url, data: userModelToJson(user));

    if (response.statusCode == 200) {
      // debugPrint(response.data["token"]);
      return response.data["token"];
    } else {
      debugPrint("Unsuccess");
    }
  }
}
