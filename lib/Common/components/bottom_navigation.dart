import 'package:flutter/material.dart';
import 'package:flutter_getx_template/Common/components/icon_alert_counter.dart';
import 'package:flutter_getx_template/core/constants/app_icons.dart';
import 'package:flutter_getx_template/core/utils/icon_renderer.dart';

class BottomNavigation extends StatelessWidget {
  final Function(int) onChanged;
  final int menuIndex;
 const  BottomNavigation({
    super.key,
    required this.menuIndex,
    required this.onChanged,
  });



  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomNavigationBar(
      // to apply shifting animation while navigation
      type: BottomNavigationBarType.shifting,
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      // Colors for the icon in different states (selected unselected)
      selectedItemColor: theme.colorScheme.primary,
      unselectedItemColor: theme.colorScheme.primary,
      // style for the texts
      unselectedLabelStyle: TextStyle(color: theme.colorScheme.primary),
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
                    color: theme.colorScheme.primary,
                  )
                  : iconRender(
                    url: AppIcons.heartOutlinedIcon,
                    color: theme.colorScheme.primary,
                  ),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: IconAlertCounter(
            icon:
                menuIndex == 2
                    ? iconRender(
                      url: AppIcons.chatIcon,
                      color: theme.colorScheme.primary,
                    )
                    : iconRender(
                      url: AppIcons.chatOutlinedIcon,
                      color: theme.colorScheme.primary,
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
                    color: theme.colorScheme.primary,
                  )
                  : iconRender(
                    url: AppIcons.personOutlinedIcon,
                    color: theme.colorScheme.primary,
                  ),
          label: 'Profile',
        ),
      ],
      onTap: onChanged,
    );
  }
}
