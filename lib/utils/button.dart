import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';

class newButton extends StatelessWidget {
  String buttontitle;
  VoidCallback onpressed;
  newButton({
    super.key,
    required this.buttontitle,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      child: Text(buttontitle),
      color: AppColors.gray,
    );
  }
}
