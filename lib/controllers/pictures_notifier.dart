import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/picture_model.dart';

class PicturesNotifier extends Notifier<List<PictureModel>> {
  @override
  List<PictureModel> build() {
    return [];
  }

  void addPicture(File file) {
    state = [...state, PictureModel(id: state.length + 1, url: file.path)];
  }
}


