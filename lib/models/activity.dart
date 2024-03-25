import 'package:equatable/equatable.dart';

class Activity extends Equatable {
  final String key;
  final String activity;
  final String type;
  final int participants;
  final double price;

  const Activity({
    required this.key,
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
  });

  Activity.fromJson(Map<String, dynamic> json)
      : key = json['key'],
        activity = json['activity'],
        type = json['type'],
        participants = json['participants'],
        price = json['price'];

  @override
  List<Object?> get props => [key, activity, type, participants, price];
}
