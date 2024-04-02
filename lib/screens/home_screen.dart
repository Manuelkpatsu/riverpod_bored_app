import 'package:flutter/material.dart';

import 'activity_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Bored App'),
      ),
      body: const Center(child: Text('Click the button to open the activity screen')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(ActivityScreen.routeName),
        child: const Icon(Icons.add),
      ),
    );
  }
}
