import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_clone/user.dart';

final timelineControllerProvider =
    ChangeNotifierProvider<TimelineController>((ref) {
  return TimelineController();
});

class TimelineController extends ChangeNotifier {
  final users = [
    const User(name: '田中さん', color: Colors.blue),
    const User(name: '松本さん', color: Colors.yellow),
    const User(name: '遠藤さん', color: Colors.green),
    const User(name: '浜田さん', color: Colors.red),
    // User(name: 'ほうせいさん', color: Colors.brown),
  ];

  void addHousei() {
    users.add(const User(name: 'ほうせいさん', color: Colors.brown));
    notifyListeners();
  }
}
