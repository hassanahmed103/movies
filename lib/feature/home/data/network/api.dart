import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/move_model.dart';

class Api {
  //get movies
  static Future<dynamic> get({
    required String url,
    @required String? token,
  }) async {
    http.Response response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    try {
      List data = jsonDecode(response.body)['results'];
      final movies = data.map((movie) => MoveModel.fromJson(movie)).toList();
      return movies;
    } catch (error) {
      print(error);
    }
  }
}
