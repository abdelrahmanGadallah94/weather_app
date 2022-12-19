import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class CustomAppBarIcon extends StatelessWidget {
  Function()? onPressed;
   CustomAppBarIcon({Key? key,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.search,size: 25.sp,)
    );
  }
}
