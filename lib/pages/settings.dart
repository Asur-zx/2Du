import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';
import 'package:flutter_application_1/utils/fonts.dart';
import 'package:provider/provider.dart';


class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final List<String> Fonts = ['Roboto', 'OpenSans','NotoSans', 'Sans Serif','Monospace', 'Helvetica', 'PicaPixel'];

  final List<double> Fontsize = [3.0,4.0,5.0,6.0];

  fontsSettings fs = fontsSettings();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        appBar: AppBar(
          title: Text(
            "S E T T I N G S",
            style: TextStyle(
            ),
          ),
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
                        value: Provider.of<fontsSettings>(context, listen: false).fontfamily,
                        onChanged: (String? newFont) {
                          setState(() {
                            Provider.of<fontsSettings>(context, listen: false).setfontfamily(newFont!);
                          });
                          Provider.of<fontsSettings>(context, listen: false).updateFfamily(newFont);
                        },
                        items: Fonts.map((String font) {
                          return DropdownMenuItem<String>(
                            value: font,
                            child: Text(font)
                          );
                        }).toList(),
                      ),
                      DropdownButton<double>(
                        value: fs.selectedSize,
                        onChanged: (double? newSize) {
                          setState(() {
                            Provider.of<fontsSettings>(context, listen: false).setfontsize(newSize!);
                          });
                        },
                        items: Fontsize.map((double size) {
                          return DropdownMenuItem<double>(
                            value: size*fs.selectionSize,
                            child: Text(size.toString(),),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    'This is sample text with dynamic font',
                    style: TextStyle(fontSize: fs.selectedSize, fontFamily: fs.selectedFont),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
      }
}
List settingOptions=[
  "font_size",
  "sort",
];
