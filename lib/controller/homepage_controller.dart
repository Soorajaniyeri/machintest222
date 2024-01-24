import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePageController extends ChangeNotifier {
  Future<List> loadPosts() async {
    String url = "https://jsonplaceholder.typicode.com/posts";
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      List posts = jsonDecode(response.body);
      return posts;
    } else {
      throw Exception("Something went wrong");
    }
  }
}
