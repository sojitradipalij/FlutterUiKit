import 'package:flutter/material.dart';
import 'package:flutteruikit/flutx/flutx.dart';
import 'package:flutteruikit/theme/app_theme.dart';

class ImportContactDialog extends StatefulWidget {
  @override
  _ImportContactWidgetState createState() => _ImportContactWidgetState();
}

class _ImportContactWidgetState extends State<ImportContactDialog> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _ImportDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialog();
          },
          child: Icon(
            Icons.download_outlined,
            size: 28,
          ),
          elevation: 2,
        ),
        body: Container(
            color: theme.backgroundColor,
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  FxText.sh2("Tap on ",
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0.2),
                  Icon(Icons.download_outlined,
                      size: 18, color: theme.colorScheme.onBackground),
                  FxText.sh2(" to import contact",
                      color: theme.colorScheme.onBackground,
                      letterSpacing: 0.2),
                ],
              ),
            )));
  }
}

class _ImportDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Container(
        decoration: BoxDecoration(
          color: theme.backgroundColor,
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
              margin: FxSpacing.nBottom(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.h6("Import contacts",
                      fontWeight: 700, letterSpacing: 0),
                  Container(
                    margin: FxSpacing.top(8),
                    child: FxText.sh2(
                        "To import contacts, select a CSV or vCard file",
                        fontWeight: 500),
                  ),
                  Container(
                    margin: FxSpacing.only(top: 8),
                    child: FxButton(
                        elevation: 0,
                        borderRadiusAll: 4,
                        onPressed: () {},
                        child: FxText.b2("Select File",
                            color: theme.colorScheme.onSecondary,
                            fontWeight: 600,
                            letterSpacing: 0.2)),
                  ),
                  Container(
                    margin: FxSpacing.top(8),
                    child: RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: "No file? ",
                          style: FxTextStyle.sh2(
                              fontWeight: 500, letterSpacing: 0)),
                      TextSpan(
                          text: "Choose account",
                          style: FxTextStyle.sh2(
                              fontWeight: 600,
                              color: theme.colorScheme.primary,
                              letterSpacing: 0)),
                      TextSpan(
                          text: " instead",
                          style: FxTextStyle.sh2(
                              fontWeight: 500, letterSpacing: 0)),
                    ])),
                  ),
                ],
              ),
            ),
            Container(
                margin: FxSpacing.fromLTRB(0, 16, 0, 16),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FxButton.text(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: FxText.b2("Cancel", fontWeight: 600)),
                    FxButton.text(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: FxText.b2("Import",
                            fontWeight: 600, color: theme.colorScheme.primary)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}