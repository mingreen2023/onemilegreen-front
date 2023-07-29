import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:onemilegreen_front/screens/home_screen.dart';
import 'package:onemilegreen_front/util/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "dotenv");

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
          return kIsWeb
              ? Row(children: [
                  const Spacer(),
                  SizedBox(
                    width: 360,
                    height: 800,
                    child: MaterialApp(
                      title: 'OneMileGreen',
                      theme: theme(),
                      home: const HomeScreen(),
                    ),
                  ),
                  const Spacer(),
                ])
              : MaterialApp(
                  title: 'OneMileGreen',
                  theme: theme(),
                  home: const HomeScreen(),
                );
        });
  }
}
