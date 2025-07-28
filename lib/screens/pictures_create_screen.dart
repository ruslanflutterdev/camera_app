import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/pictures-provider.dart';
import '../widgets/image_picker_widget.dart';

class PictureCreateScreen extends ConsumerStatefulWidget {
  const PictureCreateScreen({super.key});

  @override
  ConsumerState<PictureCreateScreen> createState() =>
      _PictureCreateScreenState();
}

class _PictureCreateScreenState extends ConsumerState<PictureCreateScreen> {
  File? _currentFile;

  void _create() {
    if (_currentFile == null) return;
    ref.read(picturesProvider.notifier).addPicture(_currentFile!);
    Navigator.pop(context);
  }

  void _onTakeFile(File? file) {
    setState(() {
      _currentFile = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Создать фото')),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImagePickerWidget(file: _currentFile, onTakeFile: _onTakeFile),
              if (_currentFile != null)
                ElevatedButton(
                  onPressed: _create,
                  child: Text('Сохранить'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}