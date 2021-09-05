import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/route/route.dart';
import 'package:myapp/viewmodel/favor_view_model.dart';
import 'package:myapp/viewmodel/flavor_view_model.dart';
import 'package:myapp/viewmodel/meal_view_model.dart';
import 'package:provider/provider.dart';
import './until/theme/app_theme.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  // provider -> viewModel -> provider/consumer
  runApp(
     MultiProvider(
       providers: [
         // ChangeNotifierProvider(create: (ctx) => MealViewModel()),
         ChangeNotifierProvider(create: (ctx) => FavorViewModel()),
         // ChangeNotifierProvider(create: (ctx) => FlavorViewModel())
         ChangeNotifierProvider(create: (ctx) => FlavorViewModel()),
         ChangeNotifierProxyProvider<FlavorViewModel, MealViewModel>(
             create: (ctx) => MealViewModel(),
             update: (ctx, flavorVM, mealVM) {
               mealVM?.updateFlavorViewModel(flavorVM);
               return mealVM!;
             }
         )
       ],
       child: MyApp(),
     )
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: '耀亭美食',
      // 主题
      theme: YTAppTheme.lightTheme,
      darkTheme: YTAppTheme.darkTheme,
      // 路由
      initialRoute: YTRouter.initialRoute,
      routes: YTRouter.routes,
      onGenerateRoute: YTRouter.generateRoute,
      onUnknownRoute: YTRouter.unknownRoute,
      builder: EasyLoading.init()
    );
  }
}
