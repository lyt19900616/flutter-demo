import 'package:flutter/material.dart';
import 'package:myapp/model/meal_data_api.dart';
import 'package:myapp/model/meal_model.dart';
import 'package:myapp/viewmodel/flavor_view_model.dart';

class MealViewModel extends ChangeNotifier {
  List<MealModel> _meals = [];

  FlavorViewModel? _flavorViewModel;

  List<MealModel> get meals {
    return _meals.where((meal) {
      if (_flavorViewModel!.isGlutenFree && !meal.isGlutenFree!) return false;
      if (_flavorViewModel!.isLactoseFree && !meal.isLactoseFree!) return false;
      if (_flavorViewModel!.isVegetarian && !meal.isVegetarian!) return false;
      if (_flavorViewModel!.isVegan && !meal.isVegan!) return false;
      return true;
    }).toList();
    // return _meals;
  }

  void updateFlavorViewModel(vm) {
    _flavorViewModel = vm;
  }
  MealViewModel() {
    MealApi.mealList().then((res) {
      _meals = res;
      notifyListeners();
    });
  }
}
