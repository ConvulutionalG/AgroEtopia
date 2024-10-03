import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<bool> checkInternet() async {
  bool? internet = await InternetConnectionChecker().hasConnection;
  return internet;
}
