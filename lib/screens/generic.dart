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
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 640) SideNavBar(name: name),
          Expanded(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(id != null ? '$name $id' : (name)),
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
