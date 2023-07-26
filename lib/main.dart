import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:onemilegreen_front/screens/home_screen.dart';
import 'package:onemilegreen_front/util/theme.dart';

void main() {
  setEnv();
  runApp(const MyApp());
}

void setEnv() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OneMileGreen',
      theme: theme(),
      home: const HomeScreen(),
    );
  }
}
