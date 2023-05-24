import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

int getIndexFromName(String name) {
  // returns the opposite
  switch (name) {
    case 'home':
      return 0;
    case 'search':
      return 1;
    case 'podcasts':
      return 2;
    case 'wallet':
      return 3;
    case 'profile':
      return 4;
    default:
      return -1;
  }
}

String getPathFromIndex(int index) {
  switch (index) {
    case 0:
      return '/';
    case 1:
      return '/search';
    case 2:
      return "/podcasts";
    case 3:
      return "/wallet";
    case 4:
      return "/profile";
    default:
      return "/";
  }
}

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
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
      currentIndex: getIndexFromName(widget.name),
      onTap: (int index) => context.go(getPathFromIndex(index)),
    );
  }
}

class SideNavBar extends StatefulWidget {
  SideNavBar({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  _SideNavBarState createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      onDestinationSelected: (int index) => context.go(getPathFromIndex(index)),
      selectedIndex: getIndexFromName(widget.name),
      destinations: const [
        NavigationRailDestination(
          icon: Icon(Icons.home),
          label: Text('Home'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.search),
          label: Text('Search'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.wifi),
          label: Text('Podcasts'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.electric_bolt),
          label: Text('Wallet'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.person),
          label: Text('Profile'),
        ),
      ],
      labelType: NavigationRailLabelType.all,
      selectedLabelTextStyle: TextStyle(
        color: Theme.of(context).colorScheme.primary,
      ),
      unselectedLabelTextStyle: TextStyle(
        color: Theme.of(context).colorScheme.secondary,
      ),
      leading: Column(
        children: const [
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
