import 'package:flutter/material.dart';
import 'package:flutter_getx_template/core/constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class IconAlertCounter extends StatelessWidget {
  /*
    The IconAlertCounter class is designed to display a notification count overlay on top of an icon.
    
    This class takes two parameters:
    1. `icon` (Widget): The icon widget to display.
    2. `count` (int): The notification count to be shown.
  */
  
  const IconAlertCounter({
    super.key,
    required this.icon,
    required this.count,
    this.bottomPadding
  });

  final Widget icon;
  final int count;
  final double? bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 12, right: 8, bottom: bottomPadding?? 0),
          child: icon,
        ),
        if(count > 0)
        Positioned(
          top: 0,
          right: 2,
          child: Container(
            padding: EdgeInsets.all(count> 9 ? 3: 6),
            decoration: BoxDecoration(
              color: AppColors.dangerColor,
              shape: BoxShape.circle
            ),
            child: Text(count.toString(), style: GoogleFonts.roboto(fontSize: 10, color: Colors.white),),
          ),
        )
      ],
    );
  }
}