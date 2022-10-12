import 'package:flutter/material.dart';
import 'package:flutteruikit/flutx/flutx.dart';
import 'package:flutteruikit/flutx/icons/box_icon/box_icon_data.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../all_apps/cookify_app/splash_screen.dart';
import '../all_apps/dating_app/views/splash_screen.dart';
import '../all_apps/estate_app/views/splash_screen.dart';
import '../all_apps/grocery_app/full_app.dart';
import '../all_apps/homemade_app/views/splash_screen.dart';
import '../all_apps/medicare_app/splash_screen.dart';
import '../all_apps/movies_app/views/splash_screen.dart' as muvi;
import '../all_apps/shopping_app/full_app.dart';
import '../theme/app_notifier.dart';
import '../theme/app_theme.dart';
import 'single_list_item.dart';

class CustomAppsViewHome extends StatefulWidget {
  @override
  _CustomAppsViewHomeState createState() => _CustomAppsViewHomeState();
}

class _CustomAppsViewHomeState extends State<CustomAppsViewHome>
    with TickerProviderStateMixin {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        return Container(
            padding: FxSpacing.fromLTRB(20, 0, 20, 20),
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                FxText.t3(
                  "APPS",
                  fontWeight: 700,
                  muted: true,
                ),
                FxSpacing.height(20),

                SinglePageListItem(
                  iconData: MdiIcons.shoppingOutline,
                  navigation: ShoppingFullApp(),
                  title: "Shopping App",
                ),
                SinglePageListItem(
                  iconData: Icons.cake_outlined,
                  navigation: SplashScreen(),
                  title: "Homemade App",
                ),
                SinglePageListItem(
                  iconData: Icons.outdoor_grill_outlined,
                  navigation: CookifySplashScreen(),
                  title: "Cookify App",
                ),
                SinglePageListItem(
                  iconData: Icons.health_and_safety_outlined,
                  navigation: MediCareSplashScreen(),
                  title: "Medi Care App",
                ),
                SinglePageListItem(
                  iconData: Icons.home_work_outlined,
                  navigation: EstateSplashScreen(),
                  title: "Estate App",
                ),
                SinglePageListItem(
                  iconData: MdiIcons.foodAppleOutline,
                  title: "Grocery App",
                  navigation: GroceryFullApp(),
                ),
                SinglePageListItem(
                  iconData: Icons.favorite_outline_rounded,
                  navigation: DatingSplashScreen(),
                  title: "Dating App",
                ),
                SinglePageListItem(
                  iconData: Icons.live_tv,
                  navigation: muvi.SplashScreen(),
                  title: "Movies App",
                ),

              ],
            ));
      },
    );
  }
}
