import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'my_logger.dart';

class MediaPickerService {
  final ImagePicker _picker = ImagePicker();

  /// ------------------------
  /// IMAGE PICKER
  /// ------------------------
  Future<File?> pickImage({required ImageSource source}) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 85,
      );

      return image != null ? File(image.path) : null;
    } catch (e) {
      AppLogger.error("Image Picker Error: $e");
      return null;
    }
  }

  Future<File?> pickImageFromGallery() async {
    return pickImage(source: ImageSource.gallery);
  }

  Future<File?> pickImageFromCamera() async {
    return pickImage(source: ImageSource.camera);
  }

  /// ------------------------
  /// VIDEO PICKER
  /// ------------------------
  Future<File?> pickVideo({required ImageSource source}) async {
    try {
      final XFile? video = await _picker.pickVideo(
        source: source,
        maxDuration: const Duration(minutes: 5), // Optional: limit duration
      );

      return video != null ? File(video.path) : null;
    } catch (e) {
      AppLogger.error("Video Picker Error: $e");
      return null;
    }
  }

  Future<File?> pickVideoFromGallery() async {
    return pickVideo(source: ImageSource.gallery);
  }

  Future<File?> pickVideoFromCamera() async {
    return pickVideo(source: ImageSource.camera);
  }


}
