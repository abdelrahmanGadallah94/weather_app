import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:untitled/views/screens/home_screen.dart';
import 'package:untitled/views/screens/search_screen.dart';
import 'package:untitled/views/settings/app_routes.dart';

import 'controller/provider/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    child: const MyApp(),
    create: (context) => WeatherProvider(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch:
                Provider.of<WeatherProvider>(context).weatherData == null
                    ? Colors.blue
                    : Provider.of<WeatherProvider>(context)
                        .weatherData!
                        .getThemeColor()),
        routes: {
          AppRoutes.homePage: (context) => HomeScreen(),
          AppRoutes.searchPage: (context) => const SearchScreen(),
        },
        initialRoute: AppRoutes.homePage,
      ),
    );
  }
}
