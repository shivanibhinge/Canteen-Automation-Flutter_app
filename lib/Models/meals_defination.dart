import 'dart:io';
import 'package:flutter/foundation.dart';

class MealData {
  final String title;
  final String id;
  final File iconImage;
  final int price;
  final String fromTime;
  final String toTime;
  final String description;
  final String categories;
  bool isCart;
  int counter;
  bool isSelected;

  MealData({
    required this.title,
    required this.fromTime,
    required this.toTime,
    required this.description,
    required this.id,
    required this.price,
    required this.iconImage,
    required this.categories,
    this.isCart = false,
    this.counter = 1,
    this.isSelected = false,
  });
}
