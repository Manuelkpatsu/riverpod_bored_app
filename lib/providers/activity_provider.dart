import 'dart:convert';
import 'package:bored_app/models/activity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final activityProvider = FutureProvider.autoDispose<Activity>((ref) async {
  // We capture whether the provider is currently disposed or not.
  var didDispose = false;
  ref.onDispose(() => didDispose = true);

  // We delay the request by 500ms, to wait for the user to stop refreshing.
  await Future<void>.delayed(const Duration(milliseconds: 500));

  // If the provider was disposed during the delay, it means that the user
  // refreshed again. We throw an exception to cancel the request.
  // It is safe to use an exception here, as it will be caught by Riverpod.
  if (didDispose) {
    throw Exception('Cancelled');
  }

  // We create an HTTP client using package:http
  final client = http.Client();
  // On dispose, we close the client.
  // This will cancel any pending request that the client might have.
  ref.onDispose(client.close);

  // We now use the client to make the request instead of the "get" function.
  final url = Uri.https('boredapi.com', '/api/activity');
  final response = await client.get(url);

  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return Activity.fromJson(json);
});
