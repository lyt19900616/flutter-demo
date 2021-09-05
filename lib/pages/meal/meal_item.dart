import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/model/meal_model.dart';
import 'package:myapp/pages/meal/meal_detail.dart';
import 'package:myapp/viewmodel/favor_view_model.dart';
import 'package:provider/provider.dart';
class MealItem extends StatelessWidget {
  final MealModel _meal;
  const MealItem(this._meal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(10.sp),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.sp)),
        child: Column(
          children: [
            createImg(context),
            createLabel()
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, MealDetail.routeName, arguments: _meal);
      },
    );
  }
  Widget createImg(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12.sp), topRight: Radius.circular(12.sp)),
          child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/placeholder.png',
              image: _meal.imageUrl!,
              width: double.infinity,
              height: 250.sp,
              fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            // width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 6.sp),
            decoration: BoxDecoration(color: Colors.black45, ),
            alignment: Alignment.center,
            child: Text(_meal.title!, style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white),),
          ),
        )
      ],
    );
  }
  
  Widget createLabel() {
    List strs = ['简单', '中等', '复杂'];
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          YTBtn(Icon(Icons.schedule, color: Color(0xff606266),), '${_meal.duration}分钟'),
          YTBtn(Icon(Icons.restaurant, color: Color(0xff606266)), strs[_meal.complexity!]),
          Consumer<FavorViewModel>(
              builder: (ctx, favorVM, child) {
                Widget icon;
                String title;
                if (favorVM.isFavor(_meal)) {
                  icon = Icon(Icons.favorite, color: Color(0xffff4400));
                  title = '已收藏';
                } else {
                  icon = Icon(Icons.favorite_border, color: Color(0xff606266),);
                  title = '未收藏';
                }
                child: return GestureDetector(
                  child: YTBtn(icon, title),
                  onTap: () {
                    favorVM.triggerFavor(_meal);
                  },
                );
              }
          )
        ],
      ),
    );
  }
}

class YTBtn extends StatelessWidget {
  final Widget _icon;
  final String _title;

  const YTBtn(this._icon, this._title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _icon,
        SizedBox(width: 4.sp,),
        Text(_title, style: TextStyle(color: Color(0xff606266), fontSize: 14.sp),)
      ],
    );
  }
}
