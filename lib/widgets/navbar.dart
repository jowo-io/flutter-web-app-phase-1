import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    switch (widget.name) {
      case 'home':
        _selectedIndex = 0;
        break;
      case 'search':
        _selectedIndex = 1;
        break;
      case 'podcasts':
        _selectedIndex = 2;
        break;
      case 'wallet':
        _selectedIndex = 3;
        break;
      case 'profile':
        _selectedIndex = 4;
        break;
    }
  }

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/search');
        break;
      case 2:
        context.go("/podcasts");
        break;
      case 3:
        context.go("/wallet");
        break;
      case 4:
        context.go("/profile");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
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
          icon: Icon(Icons.wifi),
          label: 'Podcasts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.electric_bolt),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      selectedItemColor: Theme.of(context).colorScheme.primary,
      unselectedItemColor: Theme.of(context).colorScheme.secondary,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}
