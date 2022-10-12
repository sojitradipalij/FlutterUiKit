import 'package:flutteruikit/screens/auth_screen/forgot_password1_screen.dart';
import 'package:flutteruikit/screens/auth_screen/forgot_password2_screen.dart';
import 'package:flutteruikit/screens/auth_screen/login1_screen.dart';
import 'package:flutteruikit/screens/auth_screen/login2_screen.dart';
import 'package:flutteruikit/screens/auth_screen/login_register_screen.dart';
import 'package:flutteruikit/screens/auth_screen/otp_verification_screen.dart';
import 'package:flutteruikit/screens/auth_screen/register1_screen.dart';
import 'package:flutteruikit/screens/auth_screen/register2_screen.dart';
import 'package:flutteruikit/screens/chat_screen/chat_facebook_page.dart';
import 'package:flutteruikit/screens/chat_screen/chat_home_screen.dart';
import 'package:flutteruikit/screens/chat_screen/chat_whatsapp_page.dart';
import 'package:flutteruikit/screens/course_screen/course_full_app.dart';
import 'package:flutteruikit/screens/dashboard_screen/lms_dashboard_screen.dart';
import 'package:flutteruikit/screens/dashboard_screen/seller_dashboard_screen.dart';
import 'package:flutteruikit/screens/event_screen/event_full_app.dart';
import 'package:flutteruikit/screens/food_screen/food_on_boarding_screen.dart';
import 'package:flutteruikit/screens/handyman_screen/handyman_full_app.dart';
import 'package:flutteruikit/screens/health_screen/health_full_app.dart';
import 'package:flutteruikit/screens/hotel_screen/hotel_login_screen.dart';
import 'package:flutteruikit/screens/hotel_screen/hotel_onboarding_screen.dart';
import 'package:flutteruikit/screens/hotel_screen/hotel_password_screen.dart';
import 'package:flutteruikit/screens/hotel_screen/hotel_profile_screen.dart';
import 'package:flutteruikit/screens/hotel_screen/hotel_register_screen.dart';
import 'package:flutteruikit/screens/mail_screen/mail_home_screen.dart';
import 'package:flutteruikit/screens/music_screen/music_login_screen.dart';
import 'package:flutteruikit/screens/music_screen/music_onboarding_screen.dart';
import 'package:flutteruikit/screens/music_screen/music_password_screen.dart';
import 'package:flutteruikit/screens/music_screen/music_register_screen.dart';
import 'package:flutteruikit/screens/news_screen/news_categery_screen.dart';
import 'package:flutteruikit/screens/other_screen/empty_cart_screen.dart';
import 'package:flutteruikit/screens/other_screen/faq_question_screen.dart';
import 'package:flutteruikit/screens/other_screen/maintenance_screen.dart';
import 'package:flutteruikit/screens/other_screen/no_internet_screen.dart';
import 'package:flutteruikit/screens/other_screen/page_not_found_screen.dart';
import 'package:flutteruikit/screens/other_screen/product_sold_out_screen.dart';
import 'package:flutteruikit/screens/other_screen/terms_screen.dart';
import 'package:flutteruikit/screens/profile_screen/company_profile_screen.dart';
import 'package:flutteruikit/screens/profile_screen/edit_profile_screen.dart';
import 'package:flutteruikit/screens/profile_screen/profile_screen.dart';
import 'package:flutteruikit/screens/quiz_screen/quiz_customize_screen.dart';
import 'package:flutteruikit/screens/quiz_screen/quiz_question_type1_screen.dart';
import 'package:flutteruikit/screens/quiz_screen/quiz_question_type2_screen.dart';
import 'package:flutteruikit/screens/setting_screen/account_setting_screen.dart';
import 'package:flutteruikit/screens/setting_screen/basic_setting_screen.dart';
import 'package:flutteruikit/screens/setting_screen/notification_setting_screen.dart';
import 'package:flutteruikit/screens/setting_screen/privacy_security_setting_screen.dart';
import 'package:flutteruikit/screens/shopping_screen/shopping_login_screen.dart';
import 'package:flutteruikit/screens/shopping_screen/shopping_onboarding_screen.dart';
import 'package:flutteruikit/screens/shopping_screen/shopping_password_screen.dart';
import 'package:flutteruikit/screens/shopping_screen/shopping_profile_screen.dart';
import 'package:flutteruikit/screens/shopping_screen/shopping_register_screen.dart';
import 'package:flutteruikit/screens/social_screen/social_full_app.dart';
import 'package:flutteruikit/screens/wallet_screen/wallet_crypto_screen.dart';
import 'package:flutteruikit/screens/wallet_screen/wallet_home_screen.dart';
import 'package:flutteruikit/screens/wallet_screen/wallet_payment_screen.dart';
import 'package:flutteruikit/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutteruikit/flutx/flutx.dart';
import 'package:provider/provider.dart';

import '../theme/app_notifier.dart';
import 'single_list_item.dart';

class ScreensHomeView extends StatefulWidget {
  @override
  _ScreensHomeViewState createState() => _ScreensHomeViewState();
}

class _ScreensHomeViewState extends State<ScreensHomeView> {
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
        return Container(
            padding: FxSpacing.fromLTRB(20, 0, 20, 20),
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                /*FxText.t3(
                  "APPS",
                  fontWeight: 700,
                  muted: true,
                ),

                SinglePageListItem(
                  title: "Shopping Screen",
                  icon: './assets/icons/shop-outline.png',
                  navigation: ShoppingOnboardingScreen(),
                ),
                SinglePageListItem(
                  icon: './assets/icons/health-outline.png',
                  title: "Health Screen",
                  navigation: HealthFullApp(),
                ),
                SinglePageListItem(
                  title: "Food Screen",
                  icon: './assets/icons/food-outline.png',
                  navigation: FoodOnboardingScreen(),
                ),
                SinglePageListItem(
                  title: "Hotel Screen",
                  icon: './assets/icons/hotel-outline.png',
                  navigation: HotelOnboardingScreen(),
                ),
                SinglePageListItem(
                  icon: './assets/icons/course-outline.png',
                  title: "Course Screen",
                  navigation: CourseFullApp(),
                ),
                SinglePageListItem(
                  icon: './assets/icons/instagram-outline.png',
                  title: "Social Screen",
                  navigation: SocialFullApp(),
                ),
                SinglePageListItem(
                  title: "Event Screen",
                  icon: './assets/icons/ticket-outline.png',
                  navigation: EventFullApp(),
                ),
                SinglePageListItem(
                  title: "Music Screen",
                  icon: './assets/icons/music-outline.png',
                  navigation: MusicOnboardingScreen(),
                ),
                SinglePageListItem(
                  title: "Chat Screen",
                  icon: './assets/icons/chat-outline.png',
                  navigation: ChatHomeScreen(),
                ),
                SinglePageListItem(
                  icon: './assets/icons/worker.png',
                  title: "Handyman Screen",
                  navigation: HandymanFullApp(),
                ),
                SinglePageListItem(
                  icon: './assets/icons/newspaper-outline.png',
                  title: "News Screen",
                  navigation: NewsCategoryScreen(),
                ),*/

                FxSpacing.height(20),
                FxText.t3(
                  "PAGES",
                  fontWeight: 700,
                  muted: true,
                ),

                SingleListItem(
                  title: "Quiz Screen",
                  icon: './assets/icons/quiz-outline.png',
                  isComingSoon: true,
                  comingSoonText: "Quiz app is coming soon",
                  items: [
                    SinglePageListItem(
                      icon: './assets/icons/quiz-outline.png',
                      title: "Customize Screen",
                      navigation: QuizCustomizeScreen(),
                    ),
                    SinglePageListItem(
                      icon: './assets/icons/quiz-outline.png',
                      title: "Question 1 Screen",
                      navigation: QuizQuestionType1Screen(),
                    ),
                    SinglePageListItem(
                      icon: './assets/icons/quiz-outline.png',
                      title: "Question 2 Screen",
                      navigation: QuizQuestionType2Screen(),
                    ),
                  ],
                ),
                SinglePageListItem(
                  title: "Mail Screen",
                  icon: './assets/icons/email-outline.png',
                  navigation: MailHomeScreen(),
                ),
                SingleListItem(
                  title: "Authentication Screen",
                  icon: './assets/icons/auth-outline.png',
                  items: <SinglePageListItem>[
                    SinglePageListItem(
                      title: "Login 1 Screen",
                      navigation: ShoppingLoginScreen(),
                      icon: './assets/icons/auth-outline.png',
                    ),
                    SinglePageListItem(
                      title: "Login 2 Screen",
                      icon: './assets/icons/auth-outline.png',
                      navigation: HotelLoginScreen(),
                    ),
                    SinglePageListItem(
                      title: "Login 3 Screen",
                      icon: './assets/icons/auth-outline.png',
                      navigation: MusicLoginScreen(),
                    ),
                    SinglePageListItem(
                      title: "Login 4 Screen",
                      icon: './assets/icons/auth-outline.png',
                      navigation: Login1Screen(),
                    ),
                    SinglePageListItem(
                      title: "Login 5 Screen",
                      icon: './assets/icons/auth-outline.png',
                      navigation: Login2Screen(),
                    ),
                    SinglePageListItem(
                      title: "Register 1 Screen",
                      icon: './assets/icons/auth-outline.png',
                      navigation: ShoppingRegisterScreen(),
                    ),
                    SinglePageListItem(
                      title: "Register 2 Screen",
                      icon: './assets/icons/auth-outline.png',
                      navigation: HotelRegisterScreen(),
                    ),
                    SinglePageListItem(
                      title: "Register 3 Screen",
                      icon: './assets/icons/auth-outline.png',
                      navigation: MusicRegisterScreen(),
                    ),
                    SinglePageListItem(
                      title: "Register 4 Screen",
                      icon: './assets/icons/auth-outline.png',
                      navigation: Register1Screen(),
                    ),
                    SinglePageListItem(
                      title: "Register 5 Screen",
                      icon: './assets/icons/auth-outline.png',
                      navigation: Register2Screen(),
                    ),
                    SinglePageListItem(
                      title: "Reset Password 1 Screen",
                      icon: './assets/icons/auth-outline.png',
                      navigation: ShoppingPasswordScreen(),
                    ),
                    SinglePageListItem(
                      title: "Reset Password 2 Screen",
                      icon: './assets/icons/auth-outline.png',
                      navigation: HotelPasswordScreen(),
                    ),
                    SinglePageListItem(
                      title: "Reset Password 3 Screen",
                      icon: './assets/icons/auth-outline.png',
                      navigation: MusicPasswordScreen(),
                    ),
                    SinglePageListItem(
                      title: "Reset Password 4 Screen",
                      icon: './assets/icons/auth-outline.png',
                      navigation: ForgotPassword1Screen(),
                    ),
                    SinglePageListItem(
                      title: "Reset Password 5 Screen",
                      icon: './assets/icons/auth-outline.png',
                      navigation: ForgotPassword2Screen(),
                    ),
                    SinglePageListItem(
                      title: "Login \& Register Screen",
                      icon: './assets/icons/auth-outline.png',
                      navigation: LoginRegisterScreen(),
                    ),
                    SinglePageListItem(
                      title: "OTP Verification Screen",
                      icon: './assets/icons/auth-outline.png',
                      navigation: OTPVerificationScreen(),
                    ),
                  ],
                ),
                SingleListItem(
                  title: "Settings Screen",
                  icon: './assets/icons/setting-outline.png',
                  items: <SinglePageListItem>[
                    SinglePageListItem(
                      title: "Basic Screen",
                      icon: './assets/icons/setting-outline.png',
                      navigation: BasicSettingScreen(),
                    ),
                    SinglePageListItem(
                      title: "Account Screen",
                      icon: './assets/icons/setting-outline.png',
                      navigation: AccountSettingScreen(),
                    ),
                    SinglePageListItem(
                      title: "Notification Screen",
                      icon: './assets/icons/setting-outline.png',
                      navigation: NotificationSettingScreen(),
                    ),
                    SinglePageListItem(
                      title: "Privacy Screen",
                      icon: './assets/icons/setting-outline.png',
                      navigation: PrivacySecuritySettingScreen(),
                    ),
                  ],
                ),
                SingleListItem(
                  title: "Profile Screen",
                  icon: './assets/icons/profile-outline.png',
                  items: <SinglePageListItem>[
                    SinglePageListItem(
                      title: "Social Screen",
                      icon: './assets/icons/profile-outline.png',
                      navigation: ProfileScreen(),
                    ),
                    SinglePageListItem(
                      title: "Company Screen",
                      icon: './assets/icons/profile-outline.png',
                      navigation: CompanyProfileScreen(),
                    ),
                    SinglePageListItem(
                      title: "Shopping Screen",
                      icon: './assets/icons/profile-outline.png',
                      navigation: ShoppingProfileScreen(),
                    ),
                    SinglePageListItem(
                      title: "Hotel Screen",
                      icon: './assets/icons/profile-outline.png',
                      navigation: HotelProfileScreen(),
                    ),
                    SinglePageListItem(
                      title: "Edit Screen",
                      icon: './assets/icons/profile-outline.png',
                      navigation: EditProfileScreen(),
                    ),
                  ],
                ),
                SingleListItem(
                  title: "Dashboard Screen",
                  icon: './assets/icons/dashboard-outline.png',
                  items: <SinglePageListItem>[
                    SinglePageListItem(
                      title: "LMS Screen",
                      icon: './assets/icons/dashboard-outline.png',
                      navigation: LMSDashboardScreen(),
                    ),
                    SinglePageListItem(
                      title: "Seller Screen",
                      icon: './assets/icons/dashboard-outline.png',
                      navigation: SellerDashboardScreen(),
                    ),
                  ],
                ),
                SingleListItem(
                  title: "Wallet Screen",
                  icon: './assets/icons/wallet-outline.png',
                  items: <SinglePageListItem>[
                    SinglePageListItem(
                      title: "Home Screen",
                      icon: './assets/icons/wallet-outline.png',
                      navigation: WalletHomeScreen(),
                    ),
                    SinglePageListItem(
                      title: "Payment Screen",
                      icon: './assets/icons/wallet-outline.png',
                      navigation: WalletPaymentScreen(),
                    ),
                    SinglePageListItem(
                      title: "Crypto Screen",
                      icon: './assets/icons/wallet-outline.png',
                      navigation: WalletCryptoScreen(),
                    ),
                  ],
                ),
                SingleListItem(
                  title: "Other Screen",
                  icon: './assets/icons/tablet-landscape-outline.png',
                  items: <SinglePageListItem>[
                    SinglePageListItem(
                      title: "Whatsapp Screen",
                      icon: './assets/icons/chat-outline.png',
                      navigation: ChatWhatsAppPage(),
                    ),
                    SinglePageListItem(
                      title: "Facebook Screen",
                      icon: './assets/icons/chat-outline.png',
                      navigation: ChatFacebookScreen(),
                    ),
                    SinglePageListItem(
                      title: "Empty cart Screen",
                      icon: './assets/icons/tablet-landscape-outline.png',
                      navigation: EmptyCartScreen(),
                    ),
                    SinglePageListItem(
                      title: "FAQ Screen",
                      icon: './assets/icons/tablet-landscape-outline.png',
                      navigation: FAQQuestionScreen(),
                    ),
                    SinglePageListItem(
                      title: "Maintenance Screen",
                      icon: './assets/icons/tablet-landscape-outline.png',
                      navigation: MaintenanceScreen(),
                    ),
                    SinglePageListItem(
                      title: "No internet Screen",
                      icon: './assets/icons/tablet-landscape-outline.png',
                      navigation: NoInternetScreen(),
                    ),
                    SinglePageListItem(
                      title: "Page not found Screen",
                      icon: './assets/icons/tablet-landscape-outline.png',
                      navigation: PageNotFoundScreen(),
                    ),
                    SinglePageListItem(
                      title: "Sold out Screen",
                      icon: './assets/icons/tablet-landscape-outline.png',
                      navigation: ProductSoldOutScreen(),
                    ),
                    SinglePageListItem(
                      title: "Terms Screen",
                      icon: './assets/icons/tablet-landscape-outline.png',
                      navigation: TermsScreen(),
                    ),
                  ],
                ),

              ],
            ));
      },
    );
  }
}
