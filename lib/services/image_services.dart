import 'dart:developer';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImageServices {
  Future<String?> addImageToSupabase(XFile imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      final fileExt = imageFile.path.split('.').last;
      final fileName =
          'image_${DateTime.now().millisecondsSinceEpoch}.$fileExt';

      log('Uploading: $fileName');

      await Supabase.instance.client.storage
          .from('profile')
          .uploadBinary(
            fileName,
            bytes,
            fileOptions: const FileOptions(contentType: 'image/jpeg'),
          );

      final publicUrl = Supabase.instance.client.storage
          .from('profile')
          .getPublicUrl(fileName);

      log("Public URL: $publicUrl");
      return publicUrl;
    } catch (e) {
      log('Error uploading image: $e');
      return null;
    }
  }
}
