import 'package:flutteruikit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutteruikit/flutx/flutx.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'order_screen.dart';

class GroceryCheckoutScreen extends StatefulWidget {
  @override
  _GroceryCheckoutScreenState createState() => _GroceryCheckoutScreenState();
}

class _GroceryCheckoutScreenState extends State<GroceryCheckoutScreen>
    with SingleTickerProviderStateMixin {
  int? selectedAddress = 0;
  int? selectedPayment = 0;

  List<String> _simpleChoice = ["Add new", "Find me", "Contact", "Setting"];
  late CustomTheme customTheme;
  late ThemeData theme;

  @override
  initState() {
    super.initState();
    customTheme = AppTheme.customTheme;
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: theme.copyWith(
          colorScheme: theme.colorScheme
              .copyWith(secondary: customTheme.groceryPrimary)),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                MdiIcons.chevronLeft,
                color: theme.colorScheme.onBackground,
                size: 20,
              ),
            ),
            title: FxText.sh1(
              "Checkout",
              fontWeight: 600,
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  padding: FxSpacing.fromLTRB(24, 8, 24, 24),
                  children: <Widget>[
                    FxText.b2("Shipping To", fontWeight: 600, letterSpacing: 0),
                    FxSpacing.height(16),
                    getSingleAddress(
                        index: 0,
                        title: "Home",
                        address: "1258  Bel Meadow Drive, Los Angeles, CA"),
                    getSingleAddress(
                        index: 1,
                        title: "Office",
                        address: "608  Shadowmar Drive, ALTON, LA"),
                    FxSpacing.height(24),
                    FxText.b2("Payment Method",
                        fontWeight: 600, letterSpacing: 0),
                    FxSpacing.height(24),
                    getSinglePayment(
                        index: 0,
                        method: "Master Card",
                        image: 'assets/brandImg/master-card.png'),
                    getSinglePayment(
                        index: 1,
                        method: "Visa Card",
                        image: 'assets/brandImg/visa-card.png'),
                    // Space.height(16),
                    getSinglePayment(
                        index: 2,
                        method: "Paypal",
                        image: 'assets/brandImg/paypal.png'),
                  ],
                ),
              ),
              Container(
                padding: FxSpacing.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FxText.b2("Total", fontWeight: 700),
                        FxText.b2("\$99.50",
                            letterSpacing: 0.25, fontWeight: 700),
                      ],
                    ),
                    FxSpacing.height(24),
                    FxButton.block(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GroceryOrderScreen()));
                      },
                      child: FxText.b2(
                        "PROCEED TO PAY",
                        color: customTheme.groceryOnPrimary,
                        letterSpacing: 0.5,
                        fontWeight: 600,
                      ),
                      backgroundColor: customTheme.groceryPrimary,
                      borderRadiusAll: 4,
                      padding: FxSpacing.y(12),
                      elevation: 0,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget getSingleAddress(
      {int? index, required String title, required String address}) {
    bool isSelected = index == selectedAddress;

    return FxContainer(
      onTap: () {
        setState(() {
          selectedAddress = index;
        });
      },
      margin: FxSpacing.bottom(16),
      padding: FxSpacing.all(16),
      bordered: !isSelected,
      border: Border.all(color: customTheme.border),
      color: isSelected ? customTheme.card : theme.scaffoldBackgroundColor,
      borderRadiusAll: 8,
      child: Row(
        children: [
          isSelected
              ? Container(
                  padding: FxSpacing.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: customTheme.groceryPrimary.withAlpha(40)),
                  child: Icon(
                    FeatherIcons.mapPin,
                    color: customTheme.groceryPrimary,
                    size: 14,
                  ),
                )
              : Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: customTheme.groceryPrimary)),
                ),
          FxSpacing.width(isSelected ? 16 : 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.b2(title, fontWeight: 600),
                FxSpacing.height(4),
                FxText.caption(address, fontWeight: 500, muted: true),
              ],
            ),
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return _simpleChoice.map((String choice) {
                return PopupMenuItem(
                  value: choice,
                  child: FxText.b2(choice),
                );
              }).toList();
            },
            color: customTheme.card,
            child: Icon(
              MdiIcons.dotsVertical,
              color: theme.colorScheme.onBackground,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget getSinglePayment(
      {int? index, required String image, required String method}) {
    bool isSelected = index == selectedPayment;

    return FxContainer(
      onTap: () {
        setState(() {
          selectedPayment = index;
        });
      },
      margin: FxSpacing.bottom(16),
      padding: FxSpacing.all(16),
      bordered: !isSelected,
      border: Border.all(color: customTheme.border),
      color: isSelected ? customTheme.card : theme.scaffoldBackgroundColor,
      borderRadiusAll: 8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 36,
            child: Image.asset(
              image,
            ),
          ),
          FxSpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.b2(method, fontWeight: 600),
                FxSpacing.height(8),
                FxText.overline(
                    "8765  \u2022\u2022\u2022\u2022  \u2022\u2022\u2022\u2022  7983",
                    muted: true,
                    letterSpacing: 0)
              ],
            ),
          ),
          // isSelected ? Space.width(16) : Space.width(20),
          isSelected
              ? Container(
                  padding: FxSpacing.all(8),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: customTheme.groceryPrimary.withAlpha(40)),
                  child: Icon(
                    FeatherIcons.creditCard,
                    color: customTheme.groceryPrimary,
                    size: 14,
                  ),
                )
              : Container(
                  height: 26,
                  width: 26,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: customTheme.groceryPrimary)),
                ),
        ],
      ),
    );
  }
}
