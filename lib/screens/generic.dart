import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/navbar.dart';

class GenericScreen extends StatelessWidget {
  const GenericScreen({super.key, required this.name, this.id, this.back});
  final String name;
  final String? back;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Title(
      title: id != null ? '$name $id' : name,
      color: Colors.redAccent,
      child: Scaffold(
        appBar: AppBar(
          title: Text(name),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => context.go(back == null ? '/' : back!),
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
                    Text(id != null ? '$name $id' : name),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => context.go(back == null ? '/' : back!),
                      child: const Text('back'),
                    ),
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
