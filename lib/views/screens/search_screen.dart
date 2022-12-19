import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../widgets/appBar_icon.dart';
import '../widgets/appBar_title.dart';
import '../widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
   const SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBarTitle(),
       centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: CustomTextField(),
        ),
      ),
    );
  }
}
