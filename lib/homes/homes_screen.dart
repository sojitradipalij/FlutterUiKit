import 'package:flutteruikit/images.dart';
import 'package:flutteruikit/theme/app_notifier.dart';
import 'package:flutteruikit/theme/app_theme.dart';
import 'package:flutteruikit/theme/theme_type.dart';
import 'package:flutteruikit/widgets/custom/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutteruikit/flutx/flutx.dart';
import 'package:provider/provider.dart';
import 'others_view_home.dart';
import 'custom_apps_view_home.dart';
import 'material_widgets_view_home.dart';
import 'screens_home_view.dart';

class HomesScreen extends StatefulWidget {
  HomesScreen({Key? key}) : super(key: key);

  @override
  _HomesScreenState createState() => _HomesScreenState();
}

class _HomesScreenState extends State<HomesScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;

  late ThemeData theme;
  late CustomTheme customTheme;
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  late TabController tabController;
  late List<NavItem> navItems;

  bool isDark = false;
  TextDirection textDirection = TextDirection.ltr;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 4, vsync: this, initialIndex: 0);

    navItems = [
      NavItem('Apps', Images.homeIcon, CustomAppsViewHome()),
      NavItem('Screen', Images.app2Icon, ScreensHomeView()),
      NavItem('Material Widgets', Images.materialDesignIcon,
          MaterialWidgetsViewHome(), 32),
      NavItem('Other Widgets', Images.otherDesignIcon, OthersViewHome()),
    ];

    tabController.addListener(() {
      currentIndex = tabController.index;

      setState(() {});
    });

    tabController.animation!.addListener(() {
      final aniValue = tabController.animation!.value;
      if (aniValue - currentIndex > 0.5) {
        currentIndex++;
      } else if (aniValue - currentIndex < -0.5) {
        currentIndex--;
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (BuildContext context, AppNotifier value, Widget? child) {
        isDark = AppTheme.themeType == ThemeType.dark;
        textDirection = AppTheme.textDirection;
        theme = AppTheme.theme;
        customTheme = AppTheme.customTheme;
        return Scaffold(
          key: _drawerKey,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: FxText.t2(
              navItems[currentIndex].title,
              fontWeight: 600,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: TabBarView(
                    controller: tabController,
                    physics: NeverScrollableScrollPhysics(),
                    children:
                        navItems.map((navItem) => navItem.screen).toList()),
              ),
              FxContainer.none(
                padding: FxSpacing.xy(12, 16),
                color: theme.scaffoldBackgroundColor,
                bordered: true,
                enableBorderRadius: false,
                borderRadiusAll: 0,
                border: Border(
                  top: BorderSide(width: 2, color: customTheme.border),
                ),
                child: TabBar(
                  controller: tabController,
                  indicator: FxTabIndicator(
                      indicatorColor: theme.colorScheme.primary.withOpacity(0.2),
                      indicatorStyle: FxTabIndicatorStyle.rectangle,
                      indicatorHeight: 50,
                      radius: 10,
                      yOffset: -8,
                      width: 80),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: theme.colorScheme.primary,
                  physics: NeverScrollableScrollPhysics(),
                  tabs: buildTab(),
                ),
              )
            ],
          ),
          // drawer: _buildDrawer(),
        );
      },
    );
  }

  List<Widget> buildTab() {
    List<Widget> tabs = [];

    for (int i = 0; i < navItems.length; i++) {
      tabs.add(Container(
          child: SVG(navItems[i].icon,
              color: (currentIndex == i)
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onBackground.withAlpha(220),
              size: navItems[i].size)));
    }
    return tabs;
  }
}

class NavItem {
  final String title;
  final String icon;
  final Widget screen;
  final double size;

  NavItem(this.title, this.icon, this.screen, [this.size = 28]);
}
