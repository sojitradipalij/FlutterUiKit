import 'package:flutteruikit/theme/app_theme.dart';
import 'package:flutteruikit/theme/app_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutteruikit/flutx/flutx.dart';
import 'package:provider/provider.dart';

class MusicGenresScreen extends StatefulWidget {
  @override
  _MusicGenresScreenState createState() => _MusicGenresScreenState();
}

class _MusicGenresScreenState extends State<MusicGenresScreen> {
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
            home: Scaffold(
                body: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: theme.backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "./assets/images/all_apps/music/all-l2.jpg"),
                                fit: BoxFit.cover)),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.pinkAccent.withAlpha(140),
                          child: Align(
                            alignment: Alignment.center,
                            child: FxText.h6("POP MUSIC",
                                fontWeight: 600, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "./assets/images/all_apps/music/all-l1.jpg"),
                                fit: BoxFit.cover)),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.blue.withAlpha(140),
                          child: Align(
                            alignment: Alignment.center,
                            child: FxText.h6("COUNTRY MUSIC",
                                fontWeight: 600, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "./assets/images/all_apps/music/all-l3.jpg"),
                                fit: BoxFit.cover)),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.red.withAlpha(100),
                          child: Align(
                            alignment: Alignment.center,
                            child: FxText.h6("ROCK",
                                fontWeight: 600, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
      },
    );
  }
}
