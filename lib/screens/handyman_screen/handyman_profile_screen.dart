import 'package:flutteruikit/all_apps/shopping_app/chat_screen.dart';
import 'package:flutteruikit/screens/handyman_screen/handyman_subscription_screen.dart';
import 'package:flutteruikit/theme/app_theme.dart';
import 'package:flutteruikit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutteruikit/flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HandymanProfileScreen extends StatefulWidget {
  @override
  _HandymanProfileScreenState createState() => _HandymanProfileScreenState();
}

class _HandymanProfileScreenState extends State<HandymanProfileScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView(
        padding: EdgeInsets.all(24),
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16),
            child: Column(
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                            AssetImage("./assets/images/profile/avatar_3.jpg"),
                        fit: BoxFit.fill),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: FxText.sh1("Derrick Malone",
                      fontWeight: 600, letterSpacing: 0),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24),
            padding: EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
            decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HandymanSubscriptionScreen()));
              },
              child: Row(
                children: <Widget>[
                  Icon(MdiIcons.informationOutline,
                      color: theme.colorScheme.onPrimary, size: 18),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: FxText.b2("Premium member",
                        color: Generator.goldColor,
                        fontWeight: 600,
                        letterSpacing: 0.2),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: FxText.caption("Upgrade",
                          color: theme.colorScheme.onPrimary,
                          fontWeight: 600,
                          letterSpacing: 0.2),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 24),
            child: Column(
              children: <Widget>[
                singleOption(
                    iconData: MdiIcons.mapMarkerOutline, option: "Address"),
                Divider(),
                singleOption(
                    iconData: MdiIcons.creditCardOutline,
                    option: "Subscriptions",
                    navigation: HandymanSubscriptionScreen()),
                Divider(),
                singleOption(
                    iconData: MdiIcons.faceAgent,
                    option: "Help \& Support",
                    navigation: ShoppingChatScreen()),
                Container(
                  margin: EdgeInsets.only(top: 24),
                  child: ElevatedButton(
                    style: ButtonStyle(
                        padding:
                            MaterialStateProperty.all(FxSpacing.xy(16, 0))),
                    onPressed: () {
                      // Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          MdiIcons.logoutVariant,
                          color: theme.colorScheme.onPrimary,
                          size: 18,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16),
                          child: FxText.caption("LOGOUT",
                              letterSpacing: 0.3,
                              fontWeight: 600,
                              color: theme.colorScheme.onPrimary),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget singleOption(
      {IconData? iconData, required String option, Widget? navigation}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
      child: InkWell(
        onTap: () {
          if (navigation != null)
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => navigation));
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                iconData,
                size: 22,
                color: theme.colorScheme.onBackground,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 16),
                child: FxText.b1(option, fontWeight: 600),
              ),
            ),
            Container(
              child: Icon(MdiIcons.chevronRight,
                  size: 22, color: theme.colorScheme.onBackground),
            ),
          ],
        ),
      ),
    );
  }
}
