import 'package:flutteruikit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutteruikit/flutx/flutx.dart';
import 'package:flutteruikit/images.dart';
import 'package:flutteruikit/theme/app_notifier.dart';
import 'package:flutteruikit/widgets/material/advanced/advanced_screen.dart';
import 'package:flutteruikit/widgets/material/appbar/app_bar_widget.dart';
import 'package:flutteruikit/widgets/material/appbar/search_bar_widget.dart';
import 'package:flutteruikit/widgets/material/appbar/sliver_app_bar_widget.dart';
import 'package:flutteruikit/widgets/material/basic/basic_screen.dart';
import 'package:flutteruikit/widgets/material/bottomsheet/bottom_sheets_screen.dart';
import 'package:flutteruikit/widgets/material/button/buttons_screen.dart';
import 'package:flutteruikit/widgets/material/card/cards_screen.dart';
import 'package:flutteruikit/widgets/material/carousel/carousels_screen.dart';
import 'package:flutteruikit/widgets/material/dialog/dialogs_screen.dart';
import 'package:flutteruikit/widgets/material/expansion/expansions_screen.dart';
import 'package:flutteruikit/widgets/material/input/inputs_screen.dart';
import 'package:flutteruikit/widgets/material/list/lists_screen.dart';
import 'package:flutteruikit/widgets/material/navigation/bottom_navigation_widget.dart';
import 'package:flutteruikit/widgets/material/navigation/custom_bottom_navigation_widget.dart';
import 'package:flutteruikit/widgets/material/navigation/flutx_bottom_navigation_screen.dart';
import 'package:flutteruikit/widgets/material/navigation/navigation_drawer.dart';
import 'package:flutteruikit/widgets/material/navigation/navigation_rail_widget.dart';
import 'package:flutteruikit/widgets/material/navigation/top_navigation_widget.dart';
import 'package:flutteruikit/widgets/material/navigation/top_scrollable_navigation_widget.dart';
import 'package:flutteruikit/widgets/material/progress/progresses_screen.dart';
import 'package:provider/provider.dart';

import 'single_list_item.dart';

class MaterialWidgetsViewHome extends StatefulWidget {
  @override
  _MaterialWidgetsViewHomeState createState() => _MaterialWidgetsViewHomeState();
}

class _MaterialWidgetsViewHomeState extends State<MaterialWidgetsViewHome> {
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
      theme = AppTheme.theme;
      return Container(
        child: ListView(
          padding: FxSpacing.x(20),
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          children: <Widget>[
            FxText.t3(
              "BASIC",
              fontWeight: 700,
              muted: true,
            ),
            FxSpacing.height(20),

            SinglePageListItem(
              title: "Basic",
              icon: Images.basicIcon,
              navigation: BasicScreen(),
            ),
            SingleListItem(
              title: "App Bar",
              icon: Images.topAppBarIcon,
              items: <SinglePageListItem>[
                SinglePageListItem(
                  title: "App Bars",
                  icon: Images.topAppBarIcon,
                  navigation: AppBarWidget(),
                ),
                SinglePageListItem(
                  title: "Search Bars",
                  icon: Images.topAppBarIcon,
                  navigation: SearchBarWidget(),
                ),
                SinglePageListItem(
                  title: "Sliver Appbar",
                  icon: Images.topAppBarIcon,
                  navigation: SliverAppBarWidget(),
                ),
              ],
            ),
            SinglePageListItem(
              title: "Bottom Sheet",
              icon: Images.bottomSheetIcon,
              navigation: BottomSheetsScreen(),
            ),
            SinglePageListItem(
              title: "Buttons",
              icon: Images.buttonIcon,
              navigation: ButtonsScreen(),
            ),
            SinglePageListItem(
              title: "Card",
              icon: Images.cardIcon,
              navigation: CardsScreen(),
            ),
            SinglePageListItem(
              title: "Dialogs",
              icon: Images.dialogIcon,
              navigation: DialogsScreen(),
            ),
            SinglePageListItem(
              title: "List",
              icon: Images.listBulletsIcon,
              navigation: ListsScreen(),
            ),
            SingleListItem(
              title: "Navigation",
              icon: Images.navigationIcon,
              items: <SinglePageListItem>[
                SinglePageListItem(
                  title: "FX Navigation",
                  icon: Images.navigationIcon,
                  navigation: FxBottomNavigationScreen(),
                ),
                SinglePageListItem(
                  title: "Top",
                  icon: Images.navigationIcon,
                  navigation: TopNavigationWidget(),
                ),
                SinglePageListItem(
                  icon: Images.navigationIcon,
                  title: "Scrollable",
                  navigation: TopScrollableNavigationWidget(),
                ),
                SinglePageListItem(
                  icon: Images.navigationIcon,
                  title: "Rail",
                  navigation: NavigationRailWidget(),
                ),
                SinglePageListItem(
                  icon: Images.navigationIcon,
                  title: "Bottom",
                  navigation: BottomNavigationWidget(),
                ),
                SinglePageListItem(
                  icon: Images.navigationIcon,
                  title: "Drawer",
                  navigation: NavigationDrawerWidget(),
                ),
                SinglePageListItem(
                  icon: Images.navigationIcon,
                  title: "Custom Bottom",
                  navigation: CustomBottomNavigationWidget(),
                ),
              ],
            ),


            FxSpacing.height(20),
            FxText.t3(
              "ADVANCED",
              fontWeight: 700,
              muted: true,
            ),
            FxSpacing.height(20),
            SinglePageListItem(
              title: "Advanced",
              icon: Images.advancedIcon,
              navigation: AdvancedScreen(),
            ),
            SinglePageListItem(
              title: "Carousel",
              icon: Images.carouselIcon,
              navigation: CarouselsScreen(),
            ),
            SinglePageListItem(
              title: "Expansions",
              icon: Images.expansionIcon,
              navigation: ExpansionsScreen(),
            ),
            SinglePageListItem(
              title: "Forms",
              icon: Images.formIcon,
              navigation: InputsScreen(),
            ),
            SinglePageListItem(
              title: "Progress",
              icon: Images.progressIcon,
              navigation: ProgressesScreen(),
            ),

          ],
        ),
      );
    });
  }
}
