import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_picker_repository.g.dart';

@riverpod
ImagePickerRepository imagePickerRepository(ImagePickerRepositoryRef ref) {
  final ImagePicker imagePicker = ImagePicker();
  return ImagePickerRepositoryImpl(imagePicker: imagePicker);
}

abstract class ImagePickerRepository {
  Future<XFile?> pickImageFromGallery();
  Future<XFile?> pickVideoFromGallery();
}

class ImagePickerRepositoryImpl implements ImagePickerRepository {
  final ImagePicker _imagePicker;

  ImagePickerRepositoryImpl({required ImagePicker imagePicker})
      : _imagePicker = imagePicker;

  @override
  Future<XFile?> pickImageFromGallery() {
    return _imagePicker.pickImage(source: ImageSource.gallery);
  }

  @override
  Future<XFile?> pickVideoFromGallery() {
    return _imagePicker.pickVideo(source: ImageSource.gallery);
  }
}
