import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/pages/profile/flavor.dart';
import 'package:myapp/pages/profile/profile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 212.sp,
      child: Drawer(
        child: Column(
          children: [
            createHeader(context),
            ListTile(
              leading: Icon(Icons.account_circle_rounded),
              title: Text('个人信息'),
              onTap: () {
                Navigator.pushNamed(context, ProfilePage.routeName);
              },
            ),
            ListTile(
              leading: Icon(Icons.build),
              title: Text('口味选择'),
                onTap: () {
                  Navigator.pushNamed(context, Flavor.routeName);
                }
            ),
          ],
        ),
      ),
    );
  }
  Widget createHeader(BuildContext context) {
    return Container(
      alignment: Alignment(0, 0.6),
      width: 212.sp,
      height: MediaQuery.of(context).padding.top + 56,
      color: Theme.of(context).accentColor,
      child: Text('个人设置', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),),
    );
  }
}
