import 'package:flutter/material.dart';

import '../widgets/card.dart';
import '../widgets/navbar.dart';

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
