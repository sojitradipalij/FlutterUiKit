import 'package:flutteruikit/theme/app_theme.dart';
import 'package:flutteruikit/theme/app_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutteruikit/flutx/flutx.dart';
import 'package:provider/provider.dart';

import 'shopping_login_screen.dart';

class ShoppingOnboardingScreen extends StatefulWidget {
  @override
  _ShoppingOnboardingScreenState createState() =>
      _ShoppingOnboardingScreenState();
}

class _ShoppingOnboardingScreenState extends State<ShoppingOnboardingScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppNotifier>(
        builder: (BuildContext context, AppNotifier value, Widget? child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            return Directionality(
              textDirection: AppTheme.textDirection,
              child: child!,
            );
          },
          home: Scaffold(
              body: Container(
                  height: MediaQuery.of(context).size.height,
                  color: theme.backgroundColor,
                  child: FxOnBoarding(
                    pages: <PageViewModel>[
                      PageViewModel(
                        theme.backgroundColor,
                        Padding(
                          padding: EdgeInsets.all(40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                image: AssetImage(
                                    './assets/illustration/shopping_app/illu-1.png'),
                                width: 300,
                                height: 320,
                              )),
                              SizedBox(height: 30),
                              FxText.b1(
                                  'Find lots of product\naround the world',
                                  fontWeight: 700),
                              SizedBox(height: 16),
                              FxText(
                                  'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  fontWeight: 500),
                            ],
                          ),
                        ),
                      ),
                      PageViewModel(
                        theme.backgroundColor,
                        Padding(
                          padding: EdgeInsets.all(40),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                image: AssetImage(
                                    './assets/illustration/shopping_app/illu-2.png'),
                                width: 300,
                                height: 320,
                              )),
                              SizedBox(height: 30),
                              FxText.b1('Secure payment\nwith SSL ',
                                  fontWeight: 700),
                              SizedBox(height: 16),
                              FxText.b2(
                                  'Lorem ipsum dolor sit amet, consect adipiing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  fontWeight: 500)
                            ],
                          ),
                        ),
                      ),
                      PageViewModel(
                        theme.backgroundColor,
                        Padding(
                          padding: EdgeInsets.all(40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                  child: Image(
                                image: AssetImage(
                                    './assets/illustration/shopping_app/illu-3.png'),
                                width: 300,
                                height: 320,
                              )),
                              SizedBox(height: 30),
                              FxText.b1('Fast delivery\nat a snap',
                                  fontWeight: 700),
                              SizedBox(height: 16),
                              FxText.b2(
                                  'Lorem ipsum dolor sit amet, consect adicing elit, sed do eiusmod tempor incididunt ut labore et.',
                                  fontWeight: 500),
                            ],
                          ),
                        ),
                      ),
                    ],
                    unSelectedIndicatorColor:
                        theme.colorScheme.primary.withAlpha(150),
                    selectedIndicatorColor: theme.colorScheme.primary,
                    doneWidget: InkWell(
                      splashColor: theme.colorScheme.primary,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShoppingLoginScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: FxText.sh2("DONE".toUpperCase(),
                            fontWeight: 700, color: theme.colorScheme.primary),
                      ),
                    ),
                    skipWidget: InkWell(
                      splashColor: theme.colorScheme.primary,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ShoppingLoginScreen()));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: FxText.sh2("Skip".toUpperCase(),
                            color: theme.colorScheme.primary,
                            fontWeight: 700,
                            letterSpacing: 0.6),
                      ),
                    ),
                  ))));
    });
  }
}
