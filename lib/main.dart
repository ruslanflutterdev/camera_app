import 'package:camera_app/screens/main_screen.dart';
import 'package:camera_app/screens/pictures_create_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Gallery',
        initialRoute: Routers.home,
        routes: {
          Routers.home: (context) => MainScreen(),
          Routers.createPicture: (context) => PictureCreateScreen(),
        },
      ),
    );
  }
}
