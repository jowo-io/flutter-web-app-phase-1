import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
