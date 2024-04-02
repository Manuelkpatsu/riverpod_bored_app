import 'dart:convert';
import 'package:bored_app/models/activity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final activityProvider = FutureProvider.autoDispose<Activity>((ref) async {
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
