import 'package:flutter/material.dart';
import 'package:myapp/pages/main/main.dart';
import 'package:myapp/pages/meal/meal.dart';
import 'package:myapp/pages/meal/meal_detail.dart';
import 'package:myapp/pages/profile/flavor.dart';
import 'package:myapp/pages/profile/profile.dart';
import 'package:myapp/pages/unknown.dart';

class YTRouter {
  static final String initialRoute = YTMainPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    YTMainPage.routeName: (ctx) => YTMainPage(),
    MealPage.routeName: (ctx) => MealPage(),
    MealDetail.routeName: (ctx) => MealDetail()
  };
  // 特殊路由配置
  static final RouteFactory generateRoute = (settings) {
    if (settings.name == Flavor.routeName) {
      return MaterialPageRoute(
          builder: (ctx) {
            return Flavor();
          },
        fullscreenDialog: true
      );
    } else if (settings.name == ProfilePage.routeName) {
      return MaterialPageRoute(
          builder: (ctx) {
            return ProfilePage();
          },
          fullscreenDialog: true
      );
    }
  };
  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(builder: (context) {
      return YTUnknown();
    });
  };
}