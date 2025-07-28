import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatelessWidget {
  final File? file;
  final void Function(File?) onTakeFile;

  const ImagePickerWidget({
    super.key,
    required this.file,
    required this.onTakeFile,
  });

  Future<void> _addImage() async {
    try {
      final imagePicker = ImagePicker();
      final result = await imagePicker.pickImage(source: ImageSource.camera);
      if (result == null) return;
      final file = File(result.path);
      onTakeFile(file);
    } catch (err) {
      log(err.toString());
    }
  }

  void _clear() => onTakeFile(null);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (file != null) ...[
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            child: Row(
              children: [
                Expanded(
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.file(
                        file!,
                        fit: BoxFit.cover,
                        width: 300,
                        height: 300,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ClipRect(
                    child: Transform.flip(
                      flipX: true,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Image.file(
                          file!,
                          fit: BoxFit.cover,
                          width: 300,
                          height: 300,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: _clear, child: Text('Сбросить')),
        ],
        SizedBox(height: 20),
        ElevatedButton(onPressed: _addImage, child: Text('Сфотографировать')),
      ],
    );
  }
}
