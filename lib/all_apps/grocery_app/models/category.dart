import 'package:flutteruikit/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Category {
  final String image, title;
  final Color color;

  Category(this.image, this.title, this.color);

  static List<Category> getList() {
    return [
      Category("./assets/images/all_apps/grocery_app/strawberry.png", "Fruit",
          CustomTheme.red.withAlpha(50)),
      Category("./assets/images/all_apps/grocery_app/bread.png", "Bread",
          CustomTheme.orange.withAlpha(60)),
      Category("./assets/images/all_apps/grocery_app/broccoli.png", "Veggie",
          CustomTheme.green.withAlpha(50)),
      Category("./assets/images/all_apps/grocery_app/cheese.png", "Dairy",
          CustomTheme.yellow.withAlpha(70)),
    ];
  }
}
