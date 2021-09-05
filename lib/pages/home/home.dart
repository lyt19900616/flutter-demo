import 'package:flutter/material.dart';
import 'package:myapp/model/home_category.dart';
import 'package:myapp/pages/meal/meal.dart';
import 'package:myapp/until/file/home_json.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class YTHome extends StatelessWidget {
  const YTHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('美食广场'),
        leading: IconButton(
            icon: Icon(Icons.account_circle_rounded),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            }
        )
      ),
      body: HomeBody()
    );
  }
}
class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<HomeCategoryModel>>(
      future: HomeJson.getHomeCategory(),
      builder: (BuildContext context, AsyncSnapshot<List<HomeCategoryModel>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(),);
        }
        if (snapshot.error != null) {
          return ElevatedButton(
              child: Text('请重新获取数据'),
              onPressed:  () {
              //  进行重新加载数据的操作
                this.build(context);
              }
          );
        }
        final List<HomeCategoryModel> categories = snapshot.data!;
        return GridView.builder(
            padding: EdgeInsets.all(8),
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.5
            ),
            itemBuilder: (ctx, index) {
              final finalColor = categories[index].bgColor;
              return GestureDetector(
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: finalColor,
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                          colors: [categories[index].bgColor1!, finalColor!]
                      )
                    // gradient: RadialGradient(
                    //   colors: [finalColor!, _categories[index].bgColor1!]
                    // )
                  ),
                  child: Text(categories[index].title!,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold, fontSize: 20.sp),),
                ),
                onTap: () {
                  Navigator.pushNamed(context, MealPage.routeName, arguments: categories[index]);
                },
              );
            }
        );
      }
    );
  }
}
