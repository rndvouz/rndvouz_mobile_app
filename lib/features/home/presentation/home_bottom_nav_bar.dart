import 'package:rndvouz/features/common/data/colors.dart';
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
      {'page': const HomeBrowseOrSwipe()},
      {'page': const HomeSearch()},
      {'page': const HomeUploadItem()},
      {'page': HomeNotification()},
      {'page': const HomeProfile()},
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
        padding: const EdgeInsets.only(top: 12),
        child: icon,
      ),
      activeIcon: Container(
        padding: const EdgeInsets.only(top: 12),
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
            selectedIconTheme: const IconThemeData(color: colorBrown1),
            selectedItemColor: colorBrown1,
            unselectedIconTheme: const IconThemeData(color: colorCream1),
            unselectedItemColor: colorCream1,
            currentIndex: _selectedIndex,
            onTap: _selectedPage,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            enableFeedback: false,
            items: [
          _HomeBottomNavBarItem(
              const Icon(Icons.home), const Icon(Icons.home), 'Browse'),
          _HomeBottomNavBarItem(
              const Icon(Icons.search), const Icon(Icons.search), 'Search'),
          _HomeBottomNavBarItem(const Icon(Icons.add_box),
              const Icon(Icons.add_box), 'Upload Item'),
          _HomeBottomNavBarItem(const Icon(Icons.notifications),
              const Icon(Icons.notifications), 'Notifications'),
          _HomeBottomNavBarItem(
              const Icon(Icons.person), const Icon(Icons.person), 'Profile'),
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
