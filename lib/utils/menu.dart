import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/settings.dart';
import 'package:flutter_application_1/utils/colors.dart';

import '../pages/privacy.dart';

class Menu extends StatefulWidget {
  final double drawerFontSize;
   const Menu({super.key, required this.drawerFontSize});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  List drawerContent = [];

  @override
  void initState() {
    super.initState();
    // Initialize drawerContent here
    drawerContent = [
      //[Icons.color_lens, "T H E M E S", Themes(), AppColors.white],
      [Icons.settings, "S E T T I N G S", Settings(), AppColors.white],
      [Icons.shield, "P R I V A C Y   P O L I C Y", Privacy(), AppColors.white],
    ];
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        itemCount: drawerContent.length,
        itemBuilder: (context, index) {
        return ListTile(
                leading: Icon(drawerContent[index][0], color: drawerContent[index][3],),
                title: Text(
                  drawerContent[index][1],
                  style: TextStyle(
                      color: drawerContent[index][3],
                      fontSize: widget.drawerFontSize,
                  ),
                ),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>drawerContent[index][2]));
                },
              );
            }
          );
  }
}
