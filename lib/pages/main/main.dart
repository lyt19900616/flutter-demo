import 'package:flutter/material.dart';
import '../home/home.dart';
import '../collect/collect.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_drawer.dart';

class YTMainPage extends StatefulWidget {
  static const String routeName = '/';
  const YTMainPage({Key? key}) : super(key: key);

  @override
  _YTMainPageState createState() => _YTMainPageState();
}

class _YTMainPageState extends State<YTMainPage> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height),
      designSize: Size(375, 667),
      orientation: Orientation.portrait);
      return Scaffold(
        drawer: AppDrawer(),
        body: IndexedStack(
          index: _current,
          children: [
            YTHome(),
            YTCollect()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _current,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: '收藏')
          ],
          onTap: (index) {
            setState(() {
              _current = index;
            });
          },
        ),
      );
  }
}
