import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/card.dart';
import '../widgets/navbar.dart';

String name = "podcasts";

class PodcastsScreen extends StatelessWidget {
  const PodcastsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Title(
      title: name,
      color: Colors.redAccent,
      child: Scaffold(
        appBar: AppBar(
          title: Text(name),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          ),
        ),
        body: Row(
          children: [
            if (MediaQuery.of(context).size.width >= 640)
              SideNavBar(name: name),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    const CardExample(
                        title: "foo", subtitle: "foo bar", id: "foo"),
                    const SizedBox(height: 10),
                    const CardExample(
                        title: "hello", subtitle: "hello world", id: "hello"),
                    const SizedBox(height: 10),
                    const CardExample(
                        title: "lorem", subtitle: "lorem ipsum", id: "lorem"),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: MediaQuery.of(context).size.width < 640
            ? BottomNavBar(name: name)
            : null,
      ),
    );
  }
}
