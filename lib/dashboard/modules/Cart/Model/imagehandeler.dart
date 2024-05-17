import 'dart:typed_data';
import 'package:flutter/material.dart';

class ImageDisplay extends StatelessWidget {
  final Uint8List imageBytes;

  ImageDisplay({required this.imageBytes});

  @override
  Widget build(BuildContext context) {
    return Image.memory(imageBytes);
  }
}
