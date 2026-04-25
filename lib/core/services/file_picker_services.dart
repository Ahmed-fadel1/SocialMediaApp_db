import 'package:image_picker/image_picker.dart';

class FilePickerServices {
  final ImagePicker _imagePicker = ImagePicker();

  Future<XFile?> pickImage() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
      );

      return image;
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<XFile?> takeImage() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
      );

      return image;
    } on Exception catch (e) {
      rethrow;
    }
  }
}
