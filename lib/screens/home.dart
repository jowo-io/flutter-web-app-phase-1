import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/navbar.dart';

String name = "home";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 640) SideNavBar(name: name),
          Expanded(
              child: Center(
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
          ))
        ],
      ),
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? BottomNavBar(name: name)
          : null,
    );
  }
}
