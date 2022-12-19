import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../controller/provider/weather_provider.dart';
import '../../controller/services/weather_services.dart';
import '../../modal/weather_modal.dart';
import '../settings/app_string.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController controller = TextEditingController();
   CustomTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 4.h,horizontal: 2.w),
        suffixIcon: IconButton(onPressed: ()async{

          WeatherModal ?weatherModal = await WeatherServices().getWeather(cityName: controller.text);

          Provider.of<WeatherProvider>(context,listen: false).weatherData = weatherModal;

          Provider.of<WeatherProvider>(context,listen: false).cityName = controller.text;

          Navigator.pop(context);

        }, icon: Icon(Icons.search)),
        hintText: AppString.enterACityName,
        labelText: AppString.city,
        border: OutlineInputBorder()
      ),
    );
  }
}
