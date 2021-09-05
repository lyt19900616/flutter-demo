import 'package:flutter/material.dart';
class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 200,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text('黑桃K'),
            background: Image.asset('assets/images/profile_bg.jpeg', fit: BoxFit.cover,),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text('个人信息${index + 1}'),
                  );
                },
              childCount: 10
            )
        )
      ],
    );
  }
}
