import 'package:flutteruikit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutteruikit/flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ImportContactDialogWidget extends StatefulWidget {
  @override
  _ImportContactWidgetState createState() => _ImportContactWidgetState();
}

class _ImportContactWidgetState extends State<ImportContactDialogWidget> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showDialog());
  }

  void _showDialog() {
    showDialog(
        context: context, builder: (BuildContext context) => _ImportDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Icon(
              FeatherIcons.chevronLeft,
              size: 20,
            ),
          ),
          title: FxText.sh1("Import Contact", fontWeight: 600),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialog();
          },
          child: Icon(
            MdiIcons.downloadBoxOutline,
            size: 28,
          ),
          elevation: 2,
        ),
        body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FxText.sh2("Tap on ",
                  color: theme.colorScheme.onBackground, letterSpacing: 0.2),
              Icon(MdiIcons.downloadBoxOutline,
                  size: 18, color: theme.colorScheme.onBackground),
              FxText.sh2(" to import contact",
                  color: theme.colorScheme.onBackground, letterSpacing: 0.2),
            ],
          ),
        ));
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
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FxText.h6("Import contacts",
                      fontWeight: 700, letterSpacing: 0),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: FxText.sh2(
                        "To import contacts, select a CSV or vCard file",
                        fontWeight: 500),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: FxButton(
                        borderRadiusAll: 4,
                        elevation: 2,
                        onPressed: () {},
                        child: FxText.b2("Select File",
                            color: theme.colorScheme.onSecondary,
                            fontWeight: 600,
                            letterSpacing: 0.2)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
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
                margin: EdgeInsets.only(top: 16, bottom: 12),
                alignment: AlignmentDirectional.centerEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextButton(
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
