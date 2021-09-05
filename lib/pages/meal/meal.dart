import 'package:flutter/material.dart';
import 'package:myapp/model/home_category.dart';
import 'package:myapp/model/meal_model.dart';
import 'package:myapp/pages/meal/meal_item.dart';
import 'package:myapp/viewmodel/meal_view_model.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
class MealPage extends StatelessWidget {
  static const routeName = '/meal';
  const MealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as HomeCategoryModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title!),
      ),
      body: MealBody(),
    );
  }
}
class MealBody extends StatelessWidget {
  const MealBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as HomeCategoryModel;
    return Selector<MealViewModel, List<MealModel>>(
        selector: (ctx, mealVM) => mealVM.meals.where((meal) => meal.categories!.contains(category.id)).toList(),
        shouldRebuild: (prev, next) => !ListEquality().equals(prev, next),
        builder: (ctx, meals, child) {
          return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) {
            return MealItem(meals[index]);
          }
        );
        }
    );
  }
}

// consumer
// class MealBody extends StatelessWidget {
//   const MealBody({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     final category = ModalRoute.of(context)?.settings.arguments as HomeCategoryModel;
//     return Consumer<MealViewModel>(
//       builder: (ctx, mealVM, child) {
//         final meals = mealVM.meals.where((meal) => meal.categories!.contains(category?.id)).toList();
//         return ListView.builder(
//           itemCount: meals.length,
//           itemBuilder: (ctx, index) {
//             return ListTile(
//               title: Text(meals[index].title!),
//             );
//           }
//         );
//       },
//     );
//   }
// }
