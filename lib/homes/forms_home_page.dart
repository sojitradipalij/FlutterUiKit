import 'package:flutteruikit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutteruikit/flutx/flutx.dart';

import 'single_list_item.dart';
import '../widgets/material/form/address_form_widget.dart';
import '../widgets/material/form/checkbox_widget.dart';
import '../widgets/material/form/date_picker_widget.dart';
import '../widgets/material/form/feedback_form_widget.dart';
import '../widgets/material/form/form_widget.dart';
import '../widgets/material/form/personal_information_form_widget.dart';
import '../widgets/material/form/radio_widget.dart';
import '../widgets/material/form/slider_widget.dart';
import '../widgets/material/form/switch_widget.dart';
import '../widgets/material/form/text_field_widget.dart';
import '../widgets/material/form/time_picker_widget.dart';

class FormsHomePage extends StatefulWidget {
  @override
  _FormsHomePageState createState() => _FormsHomePageState();
}

class _FormsHomePageState extends State<FormsHomePage> {
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
        title: FxText.sh1("Forms", fontWeight: 600),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: FxSpacing.x(20),
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          FxText.sh2("Inputs", fontWeight: 700),
          GridView.count(
            crossAxisCount: 2,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            padding: FxSpacing.top(20),
            mainAxisSpacing: 20,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            children: <Widget>[
              SinglePageListItem(
                title: "Text Fields",
                icon: './assets/icons/reader-outline.png',
                navigation: TextFieldWidget(),
              ),
              SinglePageListItem(
                title: "Checkbox",
                icon: './assets/icons/reader-outline.png',
                navigation: CheckboxWidget(),
              ),
              SinglePageListItem(
                title: "Radio Button",
                icon: './assets/icons/reader-outline.png',
                navigation: RadioWidget(),
              ),
              SinglePageListItem(
                icon: './assets/icons/reader-outline.png',
                title: "Switch",
                navigation: SwitchWidget(),
              ),
              SinglePageListItem(
                title: "Date Picker",
                icon: './assets/icons/reader-outline.png',
                navigation: DatePickerWidget(),
              ),
              SinglePageListItem(
                icon: './assets/icons/reader-outline.png',
                title: "Time Picker",
                navigation: TimePickerWidget(),
              ),
              SinglePageListItem(
                title: "Range Slider",
                icon: './assets/icons/reader-outline.png',
                navigation: SliderWidget(),
              ),
              SinglePageListItem(
                title: "Form",
                icon: './assets/icons/reader-outline.png',
                navigation: FormWidget(),
              ),
            ],
          ),
          FxSpacing.height(20),
          FxText.sh2("Customs", fontWeight: 700),
          GridView.count(
            crossAxisCount: 2,
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            padding: FxSpacing.y(20),
            mainAxisSpacing: 16.0,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 16.0,
            children: <Widget>[
              SinglePageListItem(
                title: "Personal",
                icon: './assets/icons/reader-outline.png',
                navigation: PersonalInformationFormWidget(),
              ),
              SinglePageListItem(
                title: "Address",
                icon: './assets/icons/reader-outline.png',
                navigation: AddressFormWidget(),
              ),
              SinglePageListItem(
                title: "Feedback",
                icon: './assets/icons/reader-outline.png',
                navigation: FeedbackFormWidget(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
