import 'package:crop_yield/ui/auth/know_about_screen.dart';
import 'package:crop_yield/ui/auth/signup_Screen.dart';
import 'package:get/get.dart';

import '../constants/routes_constants.dart';
import '../network/network_binding.dart';
import '../network/no_internet_page.dart';

import '../ui/auth/login_screen.dart';
import '../ui/auth/splash_screen.dart';
import '../ui/farmer/land_request_farmer.dart';
import '../ui/lab/L_I_Request_Received_Lab_person/L_I_Request_Received_Lab_person_screen.dart';
import '../ui/lab/L_i_Detail_Screen/L_i_Detail_Screen.dart';
import '../ui/lab/ThankYouScreen/ThankYouScreen.dart';
import '../ui/lab/UploadBacteriaFile/uploadBacteriaFile.dart';

appRoutes() => [
      GetPage(
        name: Routes.noInternetScreenRoute,
        page: () => NoInternetPage(),
        binding: NetworkBinding(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.initialRoute,
        page: () => SplashScreen(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.loginRoute,
        page: () => LoginScreen(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.signupRoute,
        page: () => SignUpScreen(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.knowAboutRoute,
        page: () => KnowAboutScreen(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.landRequestFarmerRoute,
        page: () => LandRequestFarmer(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.landRequestLabPersonDetailRoute,
        page: () => LIDetailScreen(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.landRequestLabPersonRoute,
        page: () => LInspectionRequestReceivedLabPerson(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.uploadBacteriaFileRoute,
        page: () => UploadBacteriaFile(),
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: Routes.thankYouRoute,
        page: () => ThankYouScreen(),
        transitionDuration: const Duration(milliseconds: 500),
      )
    ];
