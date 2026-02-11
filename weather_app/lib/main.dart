import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/styles.dart';

void main() {
  AppSettings settings = AppSettings();

  /// 告诉操作系统，应该支持哪些屏幕方向
  /// portraitUp 表示支持竖屏方向
  /// portraitDown 表示支持倒竖屏方向
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(MyApp(settings: settings)));
}

class AppSettings {}

class MyApp extends StatelessWidget {
  final AppSettings settings;

  const MyApp({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(
      fontFamily: GoogleFonts.lato().fontFamily,
      primaryColor: AppColor.midnightSky,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColor.midnightCloud),
      // apply 方法会 copy 当前的文本主题并将 bodyColor 和 displayColor 应用到所有文本主题中
      primaryTextTheme: Theme.of(
        context,
      ).textTheme.apply(bodyColor: AppColor.textColorDark, displayColor: AppColor.textColorDark),
      textTheme: Theme.of(
        context,
      ).textTheme.apply(bodyColor: AppColor.textColorDark, displayColor: AppColor.textColorDark),
    );

    final width = MediaQuery.of(context).size.width * 0.8;

    return MaterialApp(
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: PageContainer(settings: settings),
    );
  }
}

class PageContainer extends StatelessWidget {
  final AppSettings settings;

  const PageContainer({super.key, required this.settings});

  @override
  Widget build(BuildContext context) {
    return Text(settings.toString());
  }
}
