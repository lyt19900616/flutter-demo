import 'dart:ui';

class HomeCategoryModel {
  String? id;
  String? title;
  String? color;
  Color? bgColor;
  Color? bgColor1;

  HomeCategoryModel({this.id, this.title, this.color, this.bgColor});

  HomeCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    final colorInt = int.parse(color!, radix: 16);
    bgColor = Color(colorInt | 0xFF000000);
    bgColor1 = Color(colorInt | 0x99000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}
