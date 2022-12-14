import 'package:flutteruikit/screens/other_screen/terms_screen.dart';
import 'package:flutteruikit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutteruikit/flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ShoppingCouponScreen extends StatefulWidget {
  @override
  _ShoppingCouponScreenState createState() => _ShoppingCouponScreenState();
}

class _ShoppingCouponScreenState extends State<ShoppingCouponScreen> {
  late ThemeData theme;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(MdiIcons.chevronLeft),
          ),
          title: FxText.h6("Coupons", fontWeight: 600),
        ),
        body: Container(
          child: ListView(
            padding: FxSpacing.x(16),
            children: <Widget>[
              FxText.caption("Active".toUpperCase(),
                  muted: true, fontWeight: 700),
              FxSpacing.height(16),
              singleCoupon(
                  image: "./assets/images/all_apps/shopping_app/offer/offer-1.png",
                  offer: "Gift Card Valued at \$100 or 20% off at Puma stores",
                  expireDate: "04 Jun 2020"),
              FxSpacing.height(16),
              singleCoupon(
                  image: "./assets/images/all_apps/shopping_app/offer/offer-1.png",
                  offer: "Gift Card Valued at \$50 or 10% off at all stores",
                  expireDate: "16 July 2020"),
              FxSpacing.height(16),
              FxText.caption("Upcoming".toUpperCase(),
                  muted: true, fontWeight: 700),
              FxSpacing.height(16),
              singleCoupon(
                  image: "./assets/images/all_apps/shopping_app/offer/offer-2.png",
                  offer: "Gift Card Valued at \$100 or 20% off at Puma stores",
                  comingDate: "04 Aug 2020",
                  isActive: false),
              FxSpacing.height(16),
              singleCoupon(
                  image: "./assets/images/all_apps/shopping_app/offer/offer-2.png",
                  offer: "Gift Card Valued at \$50 or 10% off at all stores",
                  comingDate: "16 Aug 2020",
                  isActive: false),
            ],
          ),
        ));
  }

  Widget singleCoupon(
      {required String image,
      required String offer,
      String? expireDate,
      bool isActive = true,
      String? comingDate}) {
    return FxContainer(
      paddingAll: 24,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill),
                ),
              ),
              FxSpacing.width(16),
              Expanded(
                child: FxText.b2(offer, fontWeight: 600, letterSpacing: 0.2),
              )
            ],
          ),
          FxSpacing.height(16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FxText.caption(
                        isActive ? "Expires" : "Coming at",
                        muted: true,
                      ),
                      FxText.b2(isActive ? expireDate! : comingDate!,
                          fontWeight: 600),
                      FxSpacing.height(8),
                      FxButton.text(
                        padding: FxSpacing.zero,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TermsScreen()));
                        },
                        child: FxText.caption("Terms \& Condition Apply",
                            muted: true,
                            letterSpacing: 0,
                            color: theme.colorScheme.primary,
                            fontWeight: 600),
                      )
                    ],
                  ),
                ),
              ),
              FxButton(
                  backgroundColor: theme.colorScheme.primary,
                  borderRadiusAll: 4,
                  elevation: 2,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: FxText.button(
                    isActive ? "Apply" : "Activate",
                    fontWeight: 600,
                    color: isActive
                        ? theme.colorScheme.onPrimary
                        : customTheme.onDisabled,
                    letterSpacing: 0.5,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
