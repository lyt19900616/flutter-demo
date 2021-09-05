import 'package:flutter/material.dart';
class YTUnknown extends StatelessWidget {
  const YTUnknown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('未知页'),),
      body: TipBody(),
    );
  }
}

class TipBody extends StatelessWidget {
  const TipBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('您跳转到了不存在的页面'),
          ElevatedButton(
              child: Text('点击返回'),
              onPressed: () {
                Navigator.pop(context);
              }
          )
        ],
      ),
    );
  }
}
