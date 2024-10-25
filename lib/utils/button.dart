import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/fonts.dart';

class newButton extends StatelessWidget {
  String buttontitle;
  VoidCallback onpressed;
  Color? buttoncolor;
  Color? textcolor;

  newButton({
    super.key,
    required this.buttontitle,
    required this.onpressed,
    required this.buttoncolor,
    required this.textcolor,
  });
  @override
  Widget build(BuildContext context) {
    fontsSettings fs = fontsSettings();
    double buttonfontsize = fs.selectedSize/1.8;
    return MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      onPressed: onpressed,
      color: buttoncolor,
      child: Text(buttontitle, style: TextStyle(color: textcolor),),
    );
  }
}
