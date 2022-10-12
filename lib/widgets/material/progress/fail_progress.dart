//Fail Progress*/

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutteruikit/flutx/flutx.dart';
import 'package:flutteruikit/theme/app_theme.dart';

class FailProgress extends StatefulWidget {
  @override
  _FailProgressState createState() => _FailProgressState();
}

class _FailProgressState extends State<FailProgress>
    with SingleTickerProviderStateMixin {
  bool isInProgress = true;
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    startTimer();

    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  late Timer _timer;

  void startTimer() {
    setState(() {
      isInProgress = true;
    });
    const oneSec = Duration(seconds: 2);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
              _timer.cancel(),
              showMyDialog(context),
              setState(
                () {
                  isInProgress = false;
                },
              )
            });
  }

  showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return _FailDialog();
        });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: FxSpacing.all(16),
            child: Center(
                child: isInProgress
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                            theme.colorScheme.primary,
                          )),
                          FxSpacing.width(20),
                          FxText.b2("Trying...",
                              color: theme.colorScheme.onBackground,
                              letterSpacing: 0.2)
                        ],
                      )
                    : FxButton(
                        backgroundColor: theme.colorScheme.primary,
                        elevation: 0,
                        borderRadiusAll: 4,
                        onPressed: () {
                          startTimer();
                        },
                        child: FxText.b2("Try This",
                            color: theme.colorScheme.onPrimary)))));
  }
}

class _FailDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Dialog(
      child: Container(
        padding: FxSpacing.xy(24, 16),
        decoration: BoxDecoration(
          color: themeData.backgroundColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Center(
                  child: Icon(
                Icons.sentiment_dissatisfied_outlined,
                size: 40,
                color: themeData.colorScheme.onBackground.withAlpha(220),
              )),
            ),
            Container(
              margin: FxSpacing.top(16),
              child: Center(child: FxText.sh1("Oooops", fontWeight: 700)),
            ),
            Container(
              margin: FxSpacing.top(16),
              child: Center(
                  child:
                      FxText.caption("Something went wrong", fontWeight: 600)),
            ),
            Container(
              margin: FxSpacing.top(16),
              child: Center(
                  child: FxText.caption(
                "Please try again!",
                fontWeight: 500,
                textAlign: TextAlign.center,
              )),
            ),
            Container(
              margin: FxSpacing.top(16),
              child: Center(
                child: FxButton(
                    backgroundColor: themeData.colorScheme.primary,
                    elevation: 0,
                    borderRadiusAll: 4,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: FxText.caption("TRY AGAIN",
                        fontWeight: 600,
                        letterSpacing: 0.4,
                        color: themeData.colorScheme.onPrimary)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
