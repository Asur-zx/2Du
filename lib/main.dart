import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_application_1/utils/fonts.dart';
import 'package:flutter_application_1/utils/themeprovider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("tableBox");
  themeProvider tp = themeProvider();
  runApp(ChangeNotifierProvider(create: (context) => themeProvider(), child: MyApp(),));
}
class MyApp extends StatelessWidget {
  MyApp({super.key});
  fontsSettings fs = fontsSettings();
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<themeProvider>(context).themeData,
        home: Homepage(),
      );
  }
}
