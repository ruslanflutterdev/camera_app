import 'dart:io';
import 'package:flutter/material.dart';
import '../models/picture_model.dart';

class PictureCardWidget extends StatelessWidget {
  final PictureModel picture;
  const PictureCardWidget({super.key, required this.picture});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          clipBehavior: Clip.hardEdge,
          child: Image.file(
            File(picture.url),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}