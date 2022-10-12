import 'package:flutteruikit/loading_effect.dart';
import 'package:flutteruikit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutteruikit/flutx/flutx.dart';

import '../controllers/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  late ProfileController profileController;

  @override
  void initState() {
    super.initState();
    profileController =
        FxControllerStore.putOrFind<ProfileController>(ProfileController());
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ProfileController>(
        controller: profileController,
        builder: (profileController) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (profileController.uiLoading) {
      return Scaffold(
        body: Container(
            margin: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
            child: LoadingEffect.getSearchLoadingScreen(
              context,
              theme,
              customTheme,
            )),
      );
    } else {
      return Scaffold(
        body: ListView(
          padding: FxSpacing.fromLTRB(24, 48, 24, 24),
          children: [
            FxContainer(
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image(
                      image: AssetImage(profileController.user.url),
                      height: 100,
                      width: 100,
                    ),
                  ),
                  FxSpacing.width(16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FxText.b1(profileController.user.name, fontWeight: 700),
                        FxSpacing.width(8),
                        FxText.b2(
                          profileController.user.email,
                        ),
                        FxSpacing.height(8),
                        FxButton.outlined(
                            onPressed: () {},
                            splashColor:
                                customTheme.homemadeSecondary.withAlpha(40),
                            borderColor: customTheme.homemadeSecondary,
                            padding: FxSpacing.xy(16, 4),
                            borderRadiusAll: 32,
                            child: FxText.b3("Edit profile",
                                color: customTheme.homemadeSecondary))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            FxSpacing.height(16),
            FxContainer(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.t2(
                  "Account",
                  fontWeight: 700,
                ),
                FxSpacing.height(8),
                ListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  visualDensity: VisualDensity.compact,
                  title: FxText.b2(
                    "Personal Information",
                    letterSpacing: 0,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
                ListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  visualDensity: VisualDensity.compact,
                  title: FxText.b2(
                    "Country",
                    letterSpacing: 0,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
                ListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  visualDensity: VisualDensity.compact,
                  title: FxText.b2(
                    "Favorite Items",
                    letterSpacing: 0,
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 20,
                    color: theme.colorScheme.onBackground,
                  ),
                ),
                SwitchListTile(
                  dense: true,
                  contentPadding: FxSpacing.zero,
                  inactiveTrackColor:
                      customTheme.homemadeSecondary.withAlpha(100),
                  activeTrackColor:
                      customTheme.homemadeSecondary.withAlpha(150),
                  activeColor: customTheme.homemadeSecondary,
                  title: FxText.b2(
                    "Notifications",
                    letterSpacing: 0,
                  ),
                  onChanged: (value) {
                    setState(() {
                      profileController.notification = value;
                    });
                  },
                  value: profileController.notification,
                ),
                FxSpacing.height(24),
                Center(
                    child: FxButton.rounded(
                  onPressed: () {
                    profileController.logout();
                  },
                  splashColor: customTheme.homemadePrimary.withAlpha(60),
                  child: FxText.l2(
                    "LOGOUT",
                    color: customTheme.homemadePrimary,
                    letterSpacing: 0.5,
                  ),
                  elevation: 0,
                  backgroundColor: customTheme.homemadePrimary.withAlpha(40),
                ))
              ],
            )),
            FxSpacing.height(16),
            Divider(
              thickness: 0.8,
            ),
            FxSpacing.height(8),
            FxText.b3(
              "© 2021 flutteruikit. Design by Coderthemes",
              muted: true,
              textAlign: TextAlign.center,
              letterSpacing: 0,
            )
          ],
        ),
      );
    }
  }
}
