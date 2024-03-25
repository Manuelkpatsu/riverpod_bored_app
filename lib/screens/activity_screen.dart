import 'package:bored_app/models/activity.dart';
import 'package:bored_app/providers/activity_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ActivityScreen extends ConsumerWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Activity> activity = ref.watch(activityProvider);

    return Center(
      child: activity.when(
        data: (activity) => Text('Activity: $activity', textAlign: TextAlign.center),
        error: (error, stackTrace) => const Text(
          'Oops, something unexpected happened',
          textAlign: TextAlign.center,
        ),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
