import 'package:flutter/material.dart';
import 'package:myapp/viewmodel/flavor_view_model.dart';
import 'package:provider/provider.dart';

class Flavor extends StatelessWidget {
  static const routeName = '/flavor';
  const Flavor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('口味偏好'),
      ),
      body: FlavorBody(),
    );
  }
}

class FlavorBody extends StatelessWidget {
  const FlavorBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          alignment: Alignment.center,
          child: Text('选择你的口味', style: Theme.of(context).textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),),
        ),
        Expanded(
          child: Consumer<FlavorViewModel>(
            builder: (ctx, flavorVM, child) {
              return ListView(
                children: [
                  ListTile(
                    title: Text('五谷蛋白'),
                    subtitle: Text('多吃五谷杂粮有益健康'),
                    trailing: Checkbox(
                      value: flavorVM.isGlutenFree,
                      onChanged: (value) {
                          flavorVM.isGlutenFree = value ?? false;
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('不含乳糖'),
                    subtitle: Text('适合乳糖不耐受人群'),
                    trailing: Checkbox(
                      value: flavorVM.isLactoseFree,
                      onChanged: (value) {
                        flavorVM.isLactoseFree = value ?? false;
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('普通素食者'),
                    subtitle: Text('不含荤'),
                    trailing: Checkbox(
                      value: flavorVM.isVegetarian,
                      onChanged: (value) {
                        flavorVM.isVegetarian = value ?? false;
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('严格素食者'),
                    subtitle: Text('不含荤不含蛋不含奶制品等'),
                    trailing: Checkbox(
                      value: flavorVM.isVegan,
                      onChanged: (value) {
                        flavorVM.isVegan = value ?? false;
                      },
                    ),
                  )
                ],
              );
            },
          )
        )
      ],
    );
  }
}
