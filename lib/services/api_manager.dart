import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pp_news_app_api/models/newsinfo.dart';
import '../constants/strings.dart';

class API_manager {
  Future<NewsModels> getNews() async {
    var client = http.Client();
    var newsModels = null;

    try {
      var response = await client.get(Uri.parse(Strings.newsUrl));

      if (response.statusCode == 200) {
        //Call API get JSON
        var jsonString = response.body;

        //Map string to JSON object
        var jsonMap = json.decode(jsonString);

        //Use factory method to get newsModel
        newsModels = NewsModels.fromJson(jsonMap);
      }
    } catch (e) {
      return newsModels;
    }
    return newsModels;
  }
}
