import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_picker_repository.g.dart';

@riverpod
ImagePickerRepository imagePickerRepository(ImagePickerRepositoryRef ref) {
  return ImagePickerRepositoryImpl();
}

abstract class ImagePickerRepository {
  Future<XFile?> pickImageFromGallery();
  Future<XFile?> pickVideoFromGallery();
}

class ImagePickerRepositoryImpl implements ImagePickerRepository {
  @override
  Future<XFile?> pickImageFromGallery() {
    return ImagePicker().pickImage(source: ImageSource.gallery);
  }

  @override
  Future<XFile?> pickVideoFromGallery() {
    return ImagePicker().pickVideo(source: ImageSource.gallery);
  }
}
