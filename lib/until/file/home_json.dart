import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:myapp/model/home_category.dart';

class HomeJson {
  static Future<List<HomeCategoryModel>> getHomeCategory() async {
    final jsonStr = await rootBundle.loadString('assets/json/category.json');
    final result = json.decode(jsonStr);
    final categoryList = result['category'];
    final List<HomeCategoryModel> lists = [];
    for(var json in categoryList) {
      lists.add(HomeCategoryModel.fromJson(json));
    }
    return lists;
  }
}