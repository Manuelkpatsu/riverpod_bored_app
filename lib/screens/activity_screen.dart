import 'package:bored_app/models/activity.dart';
import 'package:bored_app/providers/activity_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivityScreen extends ConsumerWidget {
  static const routeName = '/activity_screen';

  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Activity> activity = ref.watch(activityProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Activity Screen'),
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(activityProvider.future),
        child: ListView(
          children: [
            switch (activity) {
              AsyncValue<Activity>(:final valueOrNull?) => Center(
                child: Text(valueOrNull.activity, textAlign: TextAlign.center),
              ),
              AsyncValue(:final error?) => Center(
                child: Text('Error: $error', textAlign: TextAlign.center),
              ),
              _ => const Center(child: CircularProgressIndicator()),
            },
          ],
        ),
      ),
    );
  }
}
