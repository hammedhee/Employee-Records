import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_crud/services/image_services.dart';

class ImagePro extends ChangeNotifier {
  XFile? imageFil;
  String? imgUrl;
  ImageServices imageServices = ImageServices();

  void addImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFil = image;
      notifyListeners();
      getImageUrl();
    } else {
      log(' No image selected');
    }
  }

  void getImageUrl() async {
    if (imageFil == null) {
      log(' No image selected');
      return;
    }

    imgUrl = await imageServices.addImageToSupabase(imageFil!);
    if (imgUrl != null) {
      log("Image uploaded successfully: $imgUrl");
    } else {
      log(' Failed to upload image');
    }
    notifyListeners();
  }
}
