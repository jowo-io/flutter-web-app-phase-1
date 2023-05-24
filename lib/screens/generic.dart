import 'package:flutter/material.dart';

import '../widgets/navbar.dart';

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
