import 'package:flutter/material.dart';
import 'package:myapp/model/meal_data_api.dart';
import 'package:myapp/pages/meal/meal_item.dart';
import 'package:myapp/viewmodel/favor_view_model.dart';
import 'package:provider/provider.dart';
class YTCollect extends StatelessWidget {
  const YTCollect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的收藏'),),
      body: CollectBody()
    );
  }
}

class CollectBody extends StatelessWidget {
  const CollectBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavorViewModel>(
        builder: (ctx, favorVM, child) {
          if (favorVM.favorMeals.length == 0) {
            return Center(
              child: Text('您尚未收藏任何美食'),
            );
          }
          child: return ListView.builder(
              itemCount: favorVM.favorMeals.length,
              itemBuilder: (itemCtx, index) {
                return MealItem(favorVM.favorMeals[index]);
              }
          );
        }
    );
  }
}


