import 'package:crop_yield/resources/color_resources.dart';
import 'package:flutter/material.dart';

class CreateCircleProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 35,
      width: 35,
      child: CircularProgressIndicator(
        color: appMainColor,
      ),
    ));
  }
}
