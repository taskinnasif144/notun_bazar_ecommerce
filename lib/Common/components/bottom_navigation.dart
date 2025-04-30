import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/components/icon_alert_counter.dart';
import 'package:flutter_getx_template/core/constants/app_icons.dart';
import 'package:flutter_getx_template/core/utils/get_color.dart';
import 'package:flutter_getx_template/core/utils/icon_renderer.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int) onChanged;
  final int menuIndex;
  BottomNavigation({
    super.key,
    required this.menuIndex,
    required this.onChanged,
  });

  final GetColor color = GetColor();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      // to apply shifting animation while navigation
      type: BottomNavigationBarType.shifting,
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      // Colors for the icon in different states (selected unselected)
      selectedItemColor: color.getPrimary(),
      unselectedItemColor: color.getPrimary(),
      // style for the texts
      unselectedLabelStyle: TextStyle(color: color.getPrimary()),
      // the currently selected index that is being set by the page view onchange method
      currentIndex: menuIndex,
      // the icons for the navigation bar (selected and unselcted)
      items: <BottomNavigationBarItem>[
        // if the index of the nav icon and selected index matches then that icon is considered to be selected
        BottomNavigationBarItem(
          icon:
              menuIndex == 0
                  ? iconRender(url: AppIcons.homeIcon)
                  : iconRender(url: AppIcons.homeOutlinedIcon),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon:
              menuIndex == 1
                  ? iconRender(
                    url: AppIcons.heartIcon,
                    color: color.getPrimary(),
                  )
                  : iconRender(
                    url: AppIcons.heartOutlinedIcon,
                    color: color.getPrimary(),
                  ),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: IconAlertCounter(
            icon:
                menuIndex == 2
                    ? iconRender(
                      url: AppIcons.chatIcon,
                      color: color.getPrimary(),
                    )
                    : iconRender(
                      url: AppIcons.chatOutlinedIcon,
                      color: color.getPrimary(),
                    ),
            count: 5,
          ),
          label: 'Messages',
        ),
        BottomNavigationBarItem(
          icon:
              menuIndex == 3
                  ? iconRender(
                    url: AppIcons.personICon,
                    color: color.getPrimary(),
                  )
                  : iconRender(
                    url: AppIcons.personOutlinedIcon,
                    color: color.getPrimary(),
                  ),
          label: 'Profile',
        ),
      ],
      onTap: onChanged,
    );
  }
}
