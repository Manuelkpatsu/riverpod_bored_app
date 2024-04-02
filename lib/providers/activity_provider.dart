import 'dart:convert';
import 'package:bored_app/extensions/debounce_and_cancel_extension.dart';
import 'package:bored_app/models/activity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final activityProvider = FutureProvider.autoDispose<Activity>((ref) async {
  // We obtain an HTTP client using the extension we created earlier.
  final client = await ref.getDebouncedHttpClient();

  // We now use the client to make the request instead of the "get" function.
  // Our request will naturally be debounced and be cancelled if the user
  // leaves the page.
  final url = Uri.https('boredapi.com', '/api/activity');
  final response = await client.get(url);

  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return Activity.fromJson(json);
});
