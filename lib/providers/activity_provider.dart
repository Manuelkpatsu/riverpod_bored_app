import 'dart:convert';
import 'package:bored_app/models/activity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final activityProvider = FutureProvider.autoDispose<Activity>((ref) async {
  final url = Uri.https('boredapi.com', '/api/activity');
  final response = await http.get(url);
  final json = jsonDecode(response.body) as Map<String, dynamic>;
  return Activity.fromJson(json);
});
