


import 'dart:convert';

import 'package:get/get.dart';

class ArticleProvider extends GetConnect{

  final baseUrl = "http://radiosaphir.net/wp-json/wp/v2/posts";

  Future<List<dynamic>> getAll() async {
    var response = await get(baseUrl);
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      return null;
    }
  }

  Future<dynamic> getOne(int id) async {
    var response = await get("$baseUrl/$id");
    if (response.statusCode == 200){
      return jsonDecode(response.body);
    }else{
      return null;
    }
  }
}