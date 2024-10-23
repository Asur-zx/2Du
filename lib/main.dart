import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/homepage.dart';
import 'package:flutter_application_1/utils/fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("tableBox");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  fontsSettings fs = fontsSettings();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>fontsSettings(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: fs.selectedFont,
      ),
      home: Homepage(),
    )
    );
  }
}
