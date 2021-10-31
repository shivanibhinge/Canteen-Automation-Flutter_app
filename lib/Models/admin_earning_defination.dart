import 'package:flutter/foundation.dart';

class AdminEarnings{
  final int totalEarning;
  final int breakfastEarn;
  final int lunchEarn;
  final int dinnerEarn;
  final int otherEarn;

  AdminEarnings({
    required this.totalEarning,
    required this.breakfastEarn,
    required this.dinnerEarn,
    required this.lunchEarn,
    required this.otherEarn,

  });
}