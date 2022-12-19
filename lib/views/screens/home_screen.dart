import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../controller/provider/weather_provider.dart';
import '../../modal/weather_modal.dart';
import '../settings/app_routes.dart';
import '../settings/app_string.dart';
import '../widgets/appBar_icon.dart';
import '../widgets/appBar_title.dart';
import '../widgets/custom_home_text.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {

  WeatherModal ? weatherData;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBarTitle(),
        actions: [
          CustomAppBarIcon(
            onPressed: (){
              Navigator.pushNamed(context, AppRoutes.searchPage);
            },
          ),
          SizedBox(width: 2.w,)
        ],
      ),
      body: weatherData == null ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomHomeText(text: AppString.noWeather),
            SizedBox(height: 1.h),
            CustomHomeText(text: AppString.tryAnotherSearch),
          ],
        ),
      ) :
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            weatherData!.getThemeColor(),
            weatherData!.getThemeColor()[400]!,
            weatherData!.getThemeColor()[100]!,
          ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            Text("${Provider.of<WeatherProvider>(context).cityName}",style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold
            ),
            ),
            const Spacer(),
            Text("Updated at: ${weatherData?.date.hour} : ${weatherData?.date.minute}",style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold
            ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.network("http:${weatherData!.icon}"),
                Text("Temp: ${weatherData!.temperature.toInt()}",style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold
                ),
                ),
                Column(
                  children: [
                    Text(
                      "maxTemp: ${weatherData!.maxTemperature.toInt()}",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 2.h,),
                    Text(
                      "minTemp: ${weatherData!.minTemperature.toInt()}",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Text(weatherData!.stateOfWeather.toString(),style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold
            ),
            ),
            const Spacer(flex: 5)
          ],
        ),
      ),
    );
  }
}
