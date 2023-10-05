import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _selectedIndex = 0;
  static const TextStyle tempTextStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.normal);

  static const List<Widget> _homescreenPages = <Widget>[
    Text(
      'Home Button: Browse/Swipe mode to be implemented!',
      style: tempTextStyle,
      textAlign: TextAlign.center,
      // Add path to browse/swipe mode
    ),
    Text(
      'Search Button: Search page to be implemented!',
      style: tempTextStyle,
      textAlign: TextAlign.center,
      // Add path to search
    ),
    Text(
      'Upload Item Button: Upload item page to be implemented!',
      style: tempTextStyle,
      textAlign: TextAlign.center,
      // Add path to browse/swipe mode
    ),
    Text(
      'Notification Button: Notification page to be implemented!',
      style: tempTextStyle,
      textAlign: TextAlign.center,
      // Add path to browse/swipe mode
    ),
    Text(
      'Profile Button: Profile page to be implemented!',
      style: tempTextStyle,
      textAlign: TextAlign.center,
      // Add path to browse/swipe mode
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RNDVOUZ'),
      ),
      body: Center(
        child: _homescreenPages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // Fixed so that it does not expand and shift other icons when tapped
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: 'Upload Item',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
