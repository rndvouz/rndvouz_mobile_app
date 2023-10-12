import 'package:app/colors.dart';
import 'package:flutter/material.dart';

import 'home_browse.dart';
import 'home_notification.dart';
import 'home_profile.dart';
import 'home_search.dart';
import 'home_upload_item.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  int _selectedIndex = 0;
  List<Map<String, Object>>? _pages;

  @override
  void initState() {
    _pages = [
      {'page': HomeBrowse()},
      {'page': HomeSearch()},
      {'page': HomeUploadItem()},
      {'page': HomeNotification()},
      {'page': HomeProfile()},
    ];

    super.initState();
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  _HomeBottomNavBarItem(Icon icon, Icon activeIcon, String label) {
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.only(top: 12),
        child: icon,
      ),
      activeIcon: Container(
        padding: EdgeInsets.only(top: 12),
        child: activeIcon,
      ),
      label: label,
    );
  }

  Widget _createHomeBottomNavigationBar() {
    return Container(
        // height: 80,
        child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0.0,
            // backgroundColor already determined
            selectedIconTheme: IconThemeData(color: colorBrown1),
            selectedItemColor: colorBrown1,
            unselectedIconTheme: IconThemeData(color: colorCream1),
            unselectedItemColor: colorCream1,
            currentIndex: _selectedIndex,
            onTap: _selectedPage,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            enableFeedback: false,
            items: [
          _HomeBottomNavBarItem(Icon(Icons.home), Icon(Icons.home), 'Browse'),
          _HomeBottomNavBarItem(
              Icon(Icons.search), Icon(Icons.search), 'Search'),
          _HomeBottomNavBarItem(
              Icon(Icons.add_box), Icon(Icons.add_box), 'Upload Item'),
          _HomeBottomNavBarItem(Icon(Icons.notifications),
              Icon(Icons.notifications), 'Notifications'),
          _HomeBottomNavBarItem(
              Icon(Icons.person), Icon(Icons.person), 'Profile'),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorCream1,
      extendBody: true,
      bottomNavigationBar: _createHomeBottomNavigationBar(),
      body: _pages![_selectedIndex]['page'] as Widget,
    );
  }
}
