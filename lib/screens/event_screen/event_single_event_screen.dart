import 'package:flutteruikit/theme/app_theme.dart';
import 'package:flutteruikit/utils/generator.dart';
import 'package:flutter/material.dart';
import 'package:flutteruikit/flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EventSingleEventScreen extends StatefulWidget {
  @override
  _EventSingleEventScreenState createState() => _EventSingleEventScreenState();
}

class _EventSingleEventScreenState extends State<EventSingleEventScreen> {
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  void initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Stack(
            children: [
              Image(
                image: AssetImage('./assets/images/all_apps/event/pattern-1.png'),
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 240,
              ),
              Positioned(
                child: Container(
                  margin: FxSpacing.fromLTRB(24, 48, 24, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: FxSpacing.all(8),
                          decoration: BoxDecoration(
                            color: customTheme.card,
                            border:
                                Border.all(color: customTheme.border, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: Icon(MdiIcons.chevronLeft,
                              color:
                                  theme.colorScheme.onBackground.withAlpha(220),
                              size: 20),
                        ),
                      ),
                      Container(
                        padding: FxSpacing.all(8),
                        decoration: BoxDecoration(
                          color: customTheme.card,
                          border:
                              Border.all(color: customTheme.border, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Icon(MdiIcons.shareOutline,
                            color:
                                theme.colorScheme.onBackground.withAlpha(220),
                            size: 20),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: FxSpacing.vertical(16),
            children: [
              Container(
                margin: FxSpacing.fromLTRB(24, 0, 24, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: FxText.h5('Widgets of the Week - Flutter',
                          fontSize: 22,
                          color: theme.colorScheme.onBackground,
                          fontWeight: 600),
                    ),
                    Container(
                      margin: FxSpacing.left(16),
                      padding: FxSpacing.all(8),
                      decoration: BoxDecoration(
                          color: theme.colorScheme.primary
                              .withAlpha(24)
                              .withAlpha(20),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Icon(MdiIcons.heartOutline,
                          size: 18, color: theme.colorScheme.primary),
                    )
                  ],
                ),
              ),
              Container(
                margin: FxSpacing.fromLTRB(24, 16, 24, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: FxSpacing.all(8),
                          decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withAlpha(24),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Icon(
                            MdiIcons.calendar,
                            size: 18,
                            color: theme.colorScheme.primary,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: FxSpacing.left(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FxText.caption("Thursday, May 29, 2020",
                                    fontWeight: 600,
                                    color: theme.colorScheme.onBackground),
                                Container(
                                  margin: FxSpacing.top(2),
                                  child: FxText.caption("8:30 AM - 11:30 AM",
                                      fontWeight: 500,
                                      color: theme.colorScheme.onBackground,
                                      xMuted: true),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: FxSpacing.top(16),
                      child: Row(
                        children: [
                          Container(
                            padding: FxSpacing.all(8),
                            decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withAlpha(24),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Icon(
                              MdiIcons.mapMarkerOutline,
                              size: 18,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: FxSpacing.left(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FxText.caption("Auditorium",
                                      fontWeight: 600,
                                      color: theme.colorScheme.onBackground),
                                  Container(
                                    margin: FxSpacing.top(2),
                                    child: FxText.caption(
                                        "SEAS, Ahmedabad University",
                                        fontWeight: 500,
                                        color: theme.colorScheme.onBackground,
                                        xMuted: true),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: FxSpacing.top(16),
                      child: Row(
                        children: [
                          Container(
                            padding: FxSpacing.all(8),
                            decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withAlpha(24),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Icon(
                              MdiIcons.tagOutline,
                              size: 18,
                              color: theme.colorScheme.primary,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: FxSpacing.left(16),
                              child: FxText.b2("\$99",
                                  fontWeight: 600,
                                  letterSpacing: 0.3,
                                  color: theme.colorScheme.onBackground),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: FxSpacing.fromLTRB(24, 24, 24, 0),
                child: FxText.sh1("About This Event",
                    fontWeight: 700, color: theme.colorScheme.onBackground),
              ),
              Container(
                margin: FxSpacing.fromLTRB(24, 12, 24, 0),
                child: RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: Generator.getDummyText(20),
                        style: FxTextStyle.sh2(
                            color: theme.colorScheme.onBackground,
                            muted: true,
                            fontWeight: 500)),
                    TextSpan(
                        text: " Read More",
                        style: FxTextStyle.caption(
                            color: theme.colorScheme.primary, fontWeight: 600))
                  ]),
                ),
              ),
              Container(
                margin: FxSpacing.fromLTRB(24, 24, 24, 0),
                child: FxText.sh1("Location",
                    fontWeight: 700, color: theme.colorScheme.onBackground),
              ),
              Container(
                margin: FxSpacing.fromLTRB(24, 16, 24, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image(
                    image: AssetImage('./assets/otherImg/map-md-snap.png'),
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: FxSpacing.fromLTRB(24, 16, 24, 0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: FxText.b2("Buy Tickets - \$39",
                      fontWeight: 600, color: theme.colorScheme.onPrimary),
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(FxSpacing.xy(16, 0))),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }
}
