import 'package:allohuggy/Service_provider/Src/Auth_Screens/login_screen.dart';
import 'package:allohuggy/Service_provider/Src/Payment_Bording/payment_sucess_register_screen.dart';
import 'package:allohuggy/Service_provider/Src/Payment_Bording/payment_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../main.dart';
import '../Src/Bottom_Bar/Service_BottomBar_Screens/BottomBar_Client_Screen/Client_Helper_Screens(c)/bank_details(c).dart';
import '../Src/Bottom_Bar/Service_BottomBar_Screens/BottomBar_Client_Screen/Client_Helper_Screens(c)/request_by_shedule(c).dart';
import '../Src/Bottom_Bar/Service_BottomBar_Screens/BottomBar_Client_Screen/Client_Helper_Screens(c)/service_request(c).dart';
import '../Src/Bottom_Bar/Service_BottomBar_Screens/BottomBar_Client_Screen/Client_Helper_Screens(c)/map_pickup(c).dart';
import '../Src/Bottom_Bar/Service_BottomBar_Screens/BottomBar_Client_Screen/Client_Helper_Screens(c)/rating_view(c).dart';
import '../Src/Bottom_Bar/Service_BottomBar_Screens/BottomBar_Client_Screen/Client_Helper_Screens(c)/search_service(c).dart';
import '../Src/Bottom_Bar/Service_BottomBar_Screens/BottomBar_Client_Screen/Client_Helper_Screens(c)/service_details(c).dart';
import '../Src/Bottom_Bar/Service_BottomBar_Screens/BottomBar_Client_Screen/Client_Helper_Screens(c)/service_history_details(c).dart';
import '../Src/Bottom_Bar/Service_BottomBar_Screens/BottomBar_Client_Screen/Client_Helper_Screens(c)/user_service_profile(c).dart';
import '../Src/Bottom_Bar/Service_BottomBar_Screens/BottomBar_Client_Screen/bottom_bar_service(c).dart';
import '../Src/Bottom_Bar/Service_BottomBar_Screens/BottomBar_Client_Screen/bottom_bar_service_history.dart';
import '../Src/Bottom_Bar/Service_BottomBar_Screens/bottom_bar_profile(c).dart';
import '../Src/Bottom_Bar/bottom_bar.dart';
import '../Src/Helper_Screens/bank_details.dart';
import '../Src/Helper_Screens/chat_gpt_view.dart';
import '../Src/Helper_Screens/chat_screen.dart';
import '../Src/Helper_Screens/edit_profile.dart';
import '../Src/Helper_Screens/faQ_view.dart';
import '../Src/Helper_Screens/history_details.dart';
import '../Src/Helper_Screens/notification_view.dart';
import '../Src/Helper_Screens/support_view.dart';
import '../Src/Language_Screen/language_type_scren.dart';
import '../Src/Language_Screen/user_type_screen.dart';
import '../Src/Map_Bording/map_form_screen.dart';
import '../Src/Map_Bording/map_screen.dart';
import '../Src/Register_Bording_Screen/register_catergory_screen.dart';
import '../Src/Register_Bording_Screen/register_form_screen.dart';
import '../Src/Register_Bording_Screen/register_otp_screen.dart';
import '../Src/Register_Bording_Screen/register_scuess_screen.dart';
import '../Src/Splash_Screen/splash_screen.dart';

class MyAppRouter {
  static final GoRouter routers = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConstants.splashScreen,
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SplashScreen());
        },
      ),
      GoRoute(
          name: MyAppRouteConstants.languageTypeScreen,
          path: '/LanguageTypeScreen',
          pageBuilder: (context, state) {
            return MaterialPage(child: LanguageTypeScreen());
          }),
      GoRoute(
          name: MyAppRouteConstants.userTypeScreen,
          path: '/UserTypeScreen',
          pageBuilder: (context, state) {
            return const MaterialPage(child: UserTypeScreen());
          }),
      GoRoute(
          name: MyAppRouteConstants.registerCategoryScreen,
          path: '/RegisterCategoryScreen',
          pageBuilder: (context, state) {
            return MaterialPage(child: RegisterCategoryScreen());
          }),
      GoRoute(
          name: MyAppRouteConstants.registerForm,
          path: '/RegisterForm',
          pageBuilder: (context, state) {
            return const MaterialPage(child: RegisterForm());
          }),
      GoRoute(
          name: MyAppRouteConstants.registerOtpScreen,
          path: '/RegisterOtpScreen',
          pageBuilder: (context, state) {
            return const MaterialPage(child: RegisterOtpScreen());
          }),
      GoRoute(
          name: MyAppRouteConstants.registerCompleteScreen,
          path: '/RegisterCompleteScreen',
          pageBuilder: (context, state) {
            return const MaterialPage(child: RegisterCompleteScreen());
          }),
      GoRoute(
          name: MyAppRouteConstants.mapScreen,
          path: '/MapScreen',
          pageBuilder: (context, state) {
            return const MaterialPage(child: MapScreen());
          }),
      GoRoute(
          name: MyAppRouteConstants.mapFromScreen,
          path: '/MapFromScreen/:houseNo/:street',
          pageBuilder: (BuildContext context, GoRouterState state) {
            // var data = state.extra as Map<String, dynamic>;
            return MaterialPage(
                child: MapFromScreen(
              houseNo: state.params['houseNo']!,
              street: state.params['street']!,
            ));
          }),
      GoRoute(
        name: MyAppRouteConstants.paymentView,
        path: '/PaymentView',
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const MaterialPage(child: PaymentView());
        },
      ),
      GoRoute(
          name: MyAppRouteConstants.onPaymentSuccess,
          path: '/OnPaymentSuccess',
          pageBuilder: (context, state) {
            return MaterialPage(child: OnPaymentSuccess());
          }),
      GoRoute(
          name: MyAppRouteConstants.loginScreen,
          path: '/LoginScreen',
          pageBuilder: (context, state) {
            return  MaterialPage(child: LoginScreen());
          }),
      GoRoute(
          name: MyAppRouteConstants.bottomBar,
          path: '/BottomBar',
          pageBuilder: (context, state) {
            return const MaterialPage(child: BottomBar());
          }),
      GoRoute(
          name: MyAppRouteConstants.bankDetails,
          path: '/BankDetails',
          pageBuilder: (context, state) {
            return  const MaterialPage(child: BankDetails());
          }),
      GoRoute(
          name: MyAppRouteConstants.historyDetails,
          path: '/HistoryDetails',
          pageBuilder: (context, state) {
            return  const MaterialPage(child: HistoryDetails());
          }),
      GoRoute(
          name: MyAppRouteConstants.editProfile,
          path: '/EditProfile',
          pageBuilder: (context, state) {
            return  const MaterialPage(child: EditProfile());
          }),
      GoRoute(
          name: MyAppRouteConstants.notificationScreen,
          path: '/NotificationScreen',
          pageBuilder: (context, state) {
            return  const MaterialPage(child: NotificationScreen());
          }),
      GoRoute(
          name: MyAppRouteConstants.supportScreen,
          path: '/SupportScreen',
          pageBuilder: (context, state) {
            return  const MaterialPage(child: SupportScreen());
          }),
      GoRoute(
          name: MyAppRouteConstants.faqScreen,
          path: '/FaqScreen',
          pageBuilder: (context, state) {
            return  const MaterialPage(child: FaqScreen());
          }),
      GoRoute(
          name: MyAppRouteConstants.chatGptScreen,
          path: '/ChatGptScreen',
          pageBuilder: (context, state) {
            return  const MaterialPage(child: ChatGptScreen());
          }),
      GoRoute(
          name: MyAppRouteConstants.chatScreen,
          path: '/ChatScreen',
          pageBuilder: (context, state) {
            return  const MaterialPage(child: ChatScreen());
          }),
      GoRoute(
          name: MyAppRouteConstants.searchServiceClient,
          path: '/SearchServiceClient',
          pageBuilder: (context, state) {
            return   const MaterialPage(child: SearchServiceClient());
          }),
      GoRoute(
          name: MyAppRouteConstants.mapPickup,
          path: '/MapPickup',
          pageBuilder: (context, state) {
            return    const MaterialPage(child: MapPickup());
          }),
      GoRoute(
          name: MyAppRouteConstants.serviceProfileClient,
          path: '/ServiceProfileClient',
          pageBuilder: (context, state) {
            return    const MaterialPage(child: ServiceProfileClient());
          }),
      GoRoute(
          name: MyAppRouteConstants.bookServiceClient,
          path: '/BookServiceClient',
          pageBuilder: (context, state) {
            return    const MaterialPage(child: BookServiceClient());
          }),
      GoRoute(
          name: MyAppRouteConstants.bookBySchedule,
          path: '/BookBySchedule',
          pageBuilder: (context, state) {
            return    const MaterialPage(child: BookBySchedule());
          }),
      GoRoute(
          name: MyAppRouteConstants.bankDetailsClient,
          path: '/BankDetailsClient',
          pageBuilder: (context, state) {
            return    const MaterialPage(child: BankDetailsClient());
          }),
      GoRoute(
          name: MyAppRouteConstants.bottomServiceClient,
          path: '/BottomServiceClient',
          pageBuilder: (context, state) {
            return   const MaterialPage(child: BottomServiceClient());
          }),
      GoRoute(
          name: MyAppRouteConstants.serviceDetailsClient,
          path: '/ServiceDetailsClient',
          pageBuilder: (context, state) {
            return   const MaterialPage(child: ServiceDetailsClient());
          }),
      GoRoute(
          name: MyAppRouteConstants.serviceHistoryClient,
          path: '/ServiceHistoryClient',
          pageBuilder: (context, state) {
            return   const MaterialPage(child: ServiceHistoryClient());
          }),
      GoRoute(
          name: MyAppRouteConstants.serviceHistoryDetailClient,
          path: '/ServiceHistoryDetailClient',
          pageBuilder: (context, state) {
            return   const MaterialPage(child: ServiceHistoryDetailClient());
          }),
      GoRoute(
          name: MyAppRouteConstants.bottomProfileClient,
          path: '/BottomProfileClient',
          pageBuilder: (context, state) {
            return   const MaterialPage(child: BottomProfileClient());
          }),
      GoRoute(
          name: MyAppRouteConstants.ratingScreen,
          path: '/RatingScreen',
          pageBuilder: (context, state) {
            return   const MaterialPage(child: RatingScreen());
          }),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: unknownView());
    },
  );
}

class MyAppRouteConstants {
  static const String splashScreen = 'splashScreen';
  static const String languageTypeScreen = 'languageTypeScreen';
  static const String userTypeScreen = 'userTypeScreen';
  static const String registerCategoryScreen = 'RegisterCategoryScreen';
  static const String registerForm = 'RegisterForm';
  static const String registerOtpScreen = 'RegisterOtpScreen';
  static const String registerCompleteScreen = 'RegisterCompleteScreen';
  static const String mapScreen = 'MapScreen';
  static const String mapFromScreen = 'MapFromScreen';
  static const String paymentView = 'PaymentView';
  static const String onPaymentSuccess = 'OnPaymentSuccess';
  static const String loginScreen = 'LoginScreen';
  static const String bottomBar = 'BottomBar';
  static const String bankDetails = 'BankDetails';
  static const String historyDetails = 'HistoryDetails';
  static const String editProfile = 'EditProfile';
  static const String notificationScreen = 'NotificationScreen';
  static const String supportScreen = 'SupportScreen';
  static const String faqScreen = 'FaqScreen';
  static const String chatGptScreen = 'ChatGptScreen';
  static const String chatScreen = 'ChatScreen';
  static const String searchServiceClient = 'SearchServiceClient';
  static const String mapPickup = 'MapPickup';
  static const String serviceProfileClient = 'ServiceProfileClient';
  static const String bookServiceClient = 'BookServiceClient';
  static const String bookBySchedule = 'BookBySchedule';
  static const String bankDetailsClient = 'BankDetailsClient';
  static const String bottomServiceClient = 'BottomServiceClient';
  static const String serviceDetailsClient = 'ServiceDetailsClient';
  static const String serviceHistoryClient = 'ServiceHistoryClient';
  static const String serviceHistoryDetailClient = 'ServiceHistoryDetailClient';
  static const String bottomProfileClient = 'BottomProfileClient';
  static const String ratingScreen = 'RatingScreen';
}
