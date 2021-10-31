import 'dart:io';

class AddPage {
  final String id;
  final String title;
  final String description;
  final String price;
  final File image;

  AddPage({
    required this.description,
    required this.id,
    required this.image,
    required this.price,
    required this.title,
  });
}
