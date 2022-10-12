import 'package:flutteruikit/images.dart';
import 'package:flutteruikit/theme/app_notifier.dart';
import 'package:flutteruikit/theme/app_theme.dart';
import 'package:flutteruikit/widgets/cupertino/dialog/cupertino_dialogs_screen.dart';
import 'package:flutteruikit/widgets/cupertino/form/cupertino_inputs_screen.dart';
import 'package:flutteruikit/widgets/syncfusion/charts/cartesian_chart_screen.dart';
import 'package:flutteruikit/widgets/syncfusion/charts/circular_chart_screen.dart';
import 'package:flutteruikit/widgets/syncfusion/charts/other_chart_screen.dart';
import 'package:flutteruikit/widgets/syncfusion/date_range/date_ranges_screen.dart';
import 'package:flutteruikit/widgets/syncfusion/gauges/gauges_screen.dart';
import 'package:flutteruikit/widgets/syncfusion/sliders/range_selectors_screen.dart';
import 'package:flutteruikit/widgets/syncfusion/sliders/range_sliders_screen.dart';
import 'package:flutteruikit/widgets/syncfusion/sliders/sliders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutteruikit/flutx/flutx.dart';
import 'package:provider/provider.dart';

import 'single_list_item.dart';

class OthersViewHome extends StatefulWidget {
  @override
  State<OthersViewHome> createState() => _OthersViewHomeState();
}

class _OthersViewHomeState extends State<OthersViewHome> {
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
      return ListView(
        padding: FxSpacing.x(20),
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: <Widget>[
          FxText.t3(
            "SYNCFUSION",
            fontWeight: 700,
            muted: true,
          ),
          FxSpacing.height(20),

          SinglePageListItem(
            title: "Cartesian Chart",
            icon: Images.cartesianBarIcon,
            navigation: CartesianChartScreen(),
          ),
          SinglePageListItem(
            title: "Circular Chart",
            icon: Images.pieChartIcon,
            navigation: CircularChartScreen(),
          ),
          SinglePageListItem(
            title: "Other Chart",
            icon: Images.cartesianBarSyncIcon,
            navigation: OtherChartScreen(),
          ),
          SinglePageListItem(
            title: "Date Range",
            icon: Images.calendarIcon,
            navigation: DateRangesScreen(),
          ),
          SinglePageListItem(
            title: "Gauges",
            icon: Images.gaugeIcon,
            navigation: GaugesScreen(),
          ),
          SinglePageListItem(
            title: "Sliders",
            icon: Images.sliderHorizontalIcon,
            navigation: SlidersScreen(),
          ),
          SinglePageListItem(
            title: "Range Sliders",
            icon: Images.rangeSliderHorizontalIcon,
            navigation: RangeSlidersScreen(),
          ),
          SinglePageListItem(
            title: "Range Selector",
            icon: Images.rangeSelectorIcon,
            navigation: RangeSelectorsScreen(),
          ),

          FxSpacing.height(20),
          FxText.t3(
            "CUPERTINO",
            fontWeight: 700,
            muted: true,
          ),
          FxSpacing.height(20),

          SinglePageListItem(
            title: "Dialogs",
            icon: Images.dialogIcon,
            navigation: CupertinoDialogsScreen(),
          ),
          SinglePageListItem(
            title: "Inputs",
            icon: Images.formIcon,
            navigation: CupertinoInputsScreen(),
          ),

        ],
      );
    });
  }
}
