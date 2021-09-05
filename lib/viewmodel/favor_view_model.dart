import 'package:flutter/material.dart';
import 'package:myapp/model/meal_model.dart';

class FavorViewModel extends ChangeNotifier {
  List<MealModel> _favorMeals = [];

  List<MealModel> get favorMeals {
    return _favorMeals;
  }
  void addMeal(MealModel meal) {
    _favorMeals.add(meal);
    notifyListeners();
  }
  void removeMeal(MealModel meal) {
    _favorMeals.remove(meal);
    notifyListeners();
  }

  bool isFavor(MealModel meal) {
    return _favorMeals.contains(meal);
  }

  void triggerFavor(MealModel meal) {
    if (isFavor(meal)) {
      removeMeal(meal);
    } else {
      addMeal(meal);
    }
  }
}