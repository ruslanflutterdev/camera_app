import 'package:camera_app/screens/pictures_screen.dart';
import 'package:flutter/material.dart';
import '../core/routers.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  void _create(BuildContext context) {
    Navigator.of(context).pushNamed(Routers.createPicture);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => _create(context), icon: Icon(Icons.add)),
        ],
      ),
      body: PicturesScreen(),
    );
  }
}
