import 'package:flutter/material.dart';

void navigateTo(T, BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => T));
}
//

// void navigateToWithClearBack(T, BuildContext context) {
//   Navigator.of(context).pushAndRemoveUntil(
//       MaterialPageRoute(builder: (BuildContext context) => T),
//           (Route<dynamic> route) => false);
// }

void navigateToWithRoutClearBack(String routName, BuildContext context) {
  Navigator.of(context).pushNamedAndRemoveUntil(routName, (route) => false);
}

void navigateToRout(String rout, BuildContext context,
    {Map<String, dynamic>? args}) {
  Navigator.of(context).pushNamed(
    rout,
    arguments: args,
  );
}
