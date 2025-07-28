import 'package:camera_app/widgets/picture_card_widget.dart';
import 'package:flutter/material.dart';
import '../models/picture_model.dart';

class PicturesGridViewWidget extends StatelessWidget {
  final List<PictureModel> pictures;
  const PicturesGridViewWidget({super.key, required this.pictures});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: pictures.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final picture = pictures[index];
        return PictureCardWidget(picture: picture);
      },
    );
  }
}