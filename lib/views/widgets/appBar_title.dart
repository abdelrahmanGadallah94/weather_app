import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../settings/app_string.dart';

class CustomAppBarTitle extends StatelessWidget {
  const CustomAppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      AppString.appBarTitle,
      style: TextStyle(
        fontSize: 18.sp
      ),
    );
  }
}
