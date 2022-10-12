import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutteruikit/flutx/flutx.dart';

import '../theme/app_theme.dart';

class SingleListItem extends StatelessWidget {
  final String title;
  final String? icon;
  final List<SinglePageListItem> items;
  final bool isComingSoon;
  final String comingSoonText;

  const SingleListItem({
    Key? key,
    required this.title,
    required this.items,
    this.icon,
    this.isComingSoon = false,
    this.comingSoonText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CustomTheme customTheme = AppTheme.customTheme;
    ThemeData theme = AppTheme.theme;
    String? assetName;
    if (icon == null) {
      assetName = 'assets/icons/rocket-outline.png';
    } else {
      assetName = icon;
    }

    Widget iconWidget = Image.asset(
      assetName!,
      color: theme.appBarTheme.iconTheme!.color,
      // color: theme.colorScheme.onPrimary,
      width: 36,
      height: 36,
    );

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SingleDetailPage(
                      title: title,
                      items: items,
                      comingSoonText: comingSoonText,
                      isComingSoon: isComingSoon,
                    )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: customTheme.card,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          border: Border.all(width: 1.2, color: customTheme.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            iconWidget,
            FxSpacing.width(20),
            Container(
              child: FxText.b1(
                title,
                fontWeight: 600,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SinglePageListItem extends StatelessWidget {
  final String? title, icon;
  final Widget navigation;
  final IconData? iconData;
  final Color? iconColor, backgroundColor, textColor, borderColor;

  const SinglePageListItem(
      {Key? key,
      required this.title,
      required this.navigation,
      this.icon,
      this.iconData,
      this.iconColor,
      this.backgroundColor,
      this.textColor,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    Widget iconWidget;
    if (icon == null) {
      if (iconData != null) {
        iconWidget = Icon(
          iconData,
          color: iconColor ?? themeData.appBarTheme.iconTheme!.color,
          // color: iconColor ?? themeData.colorScheme.onPrimary,
          size: 36,
        );
      } else {
        iconWidget = Image.asset(
          'assets/icons/rocket-outline.png',
          color: iconColor ?? themeData.appBarTheme.iconTheme!.color,
          // color: iconColor ?? themeData.colorScheme.onPrimary,
          width: 36,
          height: 36,
        );
      }
    } else {
      iconWidget = Image.asset(
        icon!,
        color: iconColor ?? themeData.appBarTheme.iconTheme!.color,
        // color: iconColor ?? themeData.colorScheme.onPrimary,
        width: 36,
        height: 36,
      );
    }

    return InkWell(
      onTap: () async {
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => navigation));
        AppTheme.resetFont();
        FxControllerStore.resetStore();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppTheme.customTheme.card,
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          border: Border.all(
              width: 1.2, color: borderColor ?? AppTheme.customTheme.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            iconWidget,
            FxSpacing.width(20),
            Container(
              child: FxText.b1(title!, fontWeight: 600, color: textColor,textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }
}

class SingleDetailPage extends StatefulWidget {
  final List<SinglePageListItem> items;
  final String title;
  final bool isComingSoon;
  final String comingSoonText;

  const SingleDetailPage(
      {Key? key,
      required this.items,
      required this.title,
      this.isComingSoon = true,
      this.comingSoonText = ""})
      : super(key: key);

  @override
  _SingleDetailPageState createState() => _SingleDetailPageState();
}

class _SingleDetailPageState extends State<SingleDetailPage> {
  late ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: FxText.sh1(widget.title, fontWeight: 600),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            FeatherIcons.chevronLeft,
            size: 20,
            color: themeData.colorScheme.onBackground,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: widget.items,
        ),
      ),
    );
  }
}
