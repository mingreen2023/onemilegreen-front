import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:onemilegreen_front/screens/home_screen.dart';
import 'package:onemilegreen_front/util/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

var logger = Logger();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'OneMileGreen',
            theme: theme(),
            home: const HomeScreen(),
          );
        });
  }
}
