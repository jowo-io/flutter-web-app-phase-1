// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// This sample app shows an app with two screens.
///
/// The first route '/' is mapped to [HomeScreen], and the second route
/// '/search' is mapped to [SearchScreen].
///
/// The buttons use context.go() to navigate to each destination. On mobile
/// devices, each destination is deep-linkable and on the web, can be navigated
/// to using the address bar.
void main() => runApp(const MyApp());

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'search',
          builder: (BuildContext context, GoRouterState state) {
            return const GenericScreen(name: "search");
          },
        ),
        GoRoute(
          path: 'podcasts',
          builder: (BuildContext context, GoRouterState state) {
            return const PodcastsScreen();
          },
        ),
        GoRoute(
          path: 'wallet',
          builder: (BuildContext context, GoRouterState state) {
            return const GenericScreen(name: "wallet");
          },
        ),
        GoRoute(
          path: 'profile',
          builder: (BuildContext context, GoRouterState state) {
            return const GenericScreen(name: "profile");
          },
        ),
        GoRoute(
          path: 'podcasts/:showId',
          builder: (context, state) => GenericScreen(
            name: 'podcasts',
            id: state.pathParameters["showId"]!,
          ),
        ),
      ],
    ),
  ],
);

/// The main app.
class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData.from(
        colorScheme: ColorScheme.dark().copyWith(
          primary: Color(0xffffe6a4),
          secondary: Color(0xffC1C2C5),
        ),
      ),
      routerConfig: _router,
    );
  }
}

/// The home screen
class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.go('/search'),
              child: const Text('Go to the Search screen'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.go('/podcasts'),
              child: const Text('Go to the Podcasts screen'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.go('/wallet'),
              child: const Text('Go to the Wallet screen'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.go('/profile'),
              child: const Text('Go to the Profile screen'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(name: "home"),
    );
  }
}

class PodcastsScreen extends StatelessWidget {
  const PodcastsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("podcasts")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10),
            const CardExample(title: "foo", subtitle: "foo bar", id: "foo"),
            const SizedBox(height: 10),
            const CardExample(
                title: "hello", subtitle: "hello world", id: "hello"),
            const SizedBox(height: 10),
            const CardExample(
                title: "lorem", subtitle: "lorem ipsum", id: "lorem"),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(name: "podcasts"),
    );
  }
}

class CardExample extends StatelessWidget {
  const CardExample(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.id});
  final String title;
  final String subtitle;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.album),
              title: Text(title),
              subtitle: Text(subtitle),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('LISTEN'),
                  onPressed: () => context.go('/podcasts/$id'),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GenericScreen extends StatelessWidget {
  const GenericScreen({super.key, required this.name, this.id});
  final String name;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(id != null ? '$name $id' : (name)),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(name: name),
    );
  }
}

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
