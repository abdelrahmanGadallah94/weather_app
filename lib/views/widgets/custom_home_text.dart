import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../settings/app_string.dart';

class CustomHomeText extends StatelessWidget {
  String text;
   CustomHomeText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
      fontSize: 22.sp,
    ),);
  }
}
