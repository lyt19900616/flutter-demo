import 'package:flutter/material.dart';
import 'package:myapp/model/meal_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:myapp/viewmodel/favor_view_model.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal_detail';
  const MealDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as MealModel;
    return Scaffold(
      appBar: AppBar(title: Text(meal.title!),),
      body: DetailBody(meal),
      floatingActionButton: Consumer<FavorViewModel>(
          builder: (ctx, favorVM, child) {
            Widget favorBtn;
            Color bgColor;
            if (favorVM.isFavor(meal)) {
              favorBtn = Icon(Icons.favorite, color: Color(0xffff4400));
              bgColor = Colors.amberAccent;
            } else {
              favorBtn = Icon(Icons.favorite_border, color: Color(0xff909399));
              bgColor = Color(0xffebeef5);
            }
            return FloatingActionButton(
              backgroundColor: bgColor,
              child: favorBtn,
              onPressed: () {
                favorVM.triggerFavor(meal);
              },
            );
          }
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  final MealModel _meal;
  const DetailBody(this._meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as MealModel;
    return SingleChildScrollView(
      child: Column(
        children: [
          createImg(),
          createTitle(context, '烹调用料'),
          createFoodMaterial(context),
          createTitle(context, '烹调步骤'),
          createFoodStep(context)
        ],
      ),
    );
  }
  Widget createImg() {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/images/placeholder.png',
      image: _meal.imageUrl!,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }
  Widget createTitle(BuildContext context, title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 8.sp),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
  Widget createFoodMaterial(BuildContext context) {
    return createBorderContainer(
      context: context,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: _meal.ingredients!.length,
        itemBuilder: (ctx, index) {
          return Card(
            color: Color(0xffffe4b5),
            child: Padding(
              padding: EdgeInsets.all(8.sp),
              child: Text(_meal.ingredients![index])
            ),
          );
        }
      ),
    );
  }
  Widget createFoodStep(BuildContext context) {
    return createBorderContainer(
        context: context,
        child: ListView.separated(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: _meal.steps!.length,
          separatorBuilder: (ctx, index) {
            return Divider();
          },
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(_meal.steps![index], style: Theme.of(context).textTheme.bodyText2,)
            );
          }
        )
    );
  }

  Widget createBorderContainer({required BuildContext context, required Widget child}) {
    return Container(
      width: MediaQuery.of(context).size.width - 32.sp,
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
        color: Color(0xfffffff0),
        border: Border.all(color: Color(0xffebeef5)),
        borderRadius: BorderRadius.circular(6)
      ),
      child: child
    );
  }
}