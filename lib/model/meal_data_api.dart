import 'package:myapp/model/meal_model.dart';
import 'package:myapp/until/request/YTRequest.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class MealApi {
  static Future<List<MealModel>> mealList() async {
    // 读取本地数据代替网络请求
    final jsonStr = await rootBundle.loadString('assets/json/meal.json');
    final result = json.decode(jsonStr);
    // 网络请求
    // final result = await YTRequest.getInstance().get('api/meal');
    final mealArr = result['meal'];
    List<MealModel> meals = [];
    for(var json in mealArr) {
      meals.add(MealModel.fromJson(json));
    }
    return meals;
  }
}