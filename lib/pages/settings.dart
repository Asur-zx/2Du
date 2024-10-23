import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/fonts.dart';
import 'package:provider/provider.dart';


class Settings extends StatelessWidget {
  Settings({super.key});

  final List<String> Fonts = ['Roboto', 'OpenSans','NotoSans', 'Sans Serif','Monospace', 'Helvetica', 'PicaPixel'];

  final List<double> Fontsize = [3.0,4.0,5.0,6.0];

  fontsSettings fs = fontsSettings();

  @override
  Widget build(BuildContext context) {
    return Consumer<fontsSettings>(
      builder: (context, fontsSettings, child){
      return Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          title: Text(
            "S E T T I N G S",
            style: TextStyle(
                color: AppColors.palewhite
            ),
          ),
          backgroundColor: AppColors.black,
          iconTheme: IconThemeData(color: AppColors.palewhite),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(    //dropdowns
                    children: [
                      DropdownButton<String>(
                        dropdownColor: AppColors.black,
                        value: fs.selectedFont,
                        onChanged: (String? newFont) {
                          fs.setfontfamily(newFont!);
                        },
                        items: Fonts.map((String font) {
                          return DropdownMenuItem<String>(
                            value: font,
                            child: Text(font, style: TextStyle(color: AppColors.white),),
                          );
                        }).toList(),
                      ),
                      DropdownButton<double>(
                        dropdownColor: AppColors.black,
                        value: fs.selectedSize,
                        onChanged: (double? newSize) {
                        fs.setfontsize(newSize!);
                        },
                        items: Fontsize.map((double size) {
                          return DropdownMenuItem<double>(
                            value: size*fs.selectionSize,
                            child: Text(size.toString(), style: TextStyle(color: AppColors.white),),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'This is sample text with dynamic font',
                    style: TextStyle(fontSize: fs.selectedSize, color: AppColors.white, fontFamily: fs.selectedFont),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      }
    );
  }
}
List settingOptions=[
  "font_size",
  "sort",
];
