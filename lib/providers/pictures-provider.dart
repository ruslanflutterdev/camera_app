import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/pictures_notifier.dart';
import '../models/picture_model.dart';

final picturesProvider = NotifierProvider<PicturesNotifier, List<PictureModel>>(
      () {
    return PicturesNotifier();
  },
);
