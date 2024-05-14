import 'dart:io';

import 'package:gamemuncheol/common/model/media_model.dart';
import 'package:gamemuncheol/common/service/image_picker/image_picker_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_picker_service.g.dart';

@riverpod
ImagePickerService imagePickerService(ImagePickerServiceRef ref) {
  final ImagePickerRepository imagePickerRepository =
      ref.read(imagePickerRepositoryProvider);
  return ImagePickerServiceImpl(imagePickerRepository: imagePickerRepository);
}

abstract class ImagePickerService {
  Future<double> calculateFileSize(File file);
  Future<MediaModel?> pickImageFromGallery({required int? maxByte});
  Future<MediaModel?> pickVideoFromGallery({required int? maxByte});
}

class ImagePickerServiceImpl implements ImagePickerService {
  final ImagePickerRepository imagePickerRepository;

  ImagePickerServiceImpl({required this.imagePickerRepository});

  @override
  Future<double> calculateFileSize(File file) async {
    int fileSizeInBytes = await file.length();
    double fileSizeInMB = fileSizeInBytes / (1024 * 1024);

    return fileSizeInMB;
  }

  @override
  Future<MediaModel?> pickImageFromGallery({required int? maxByte}) async {
    final XFile? xfile = await imagePickerRepository.pickImageFromGallery();

    if (xfile == null) {
      return null;
    }

    File file = File(xfile.path);

    if (maxByte != null) {
      if (await calculateFileSize(file) > maxByte) {
        return MediaModel(file: null);
      }
    }

    return MediaModel(file: file);
  }

  @override
  Future<MediaModel?> pickVideoFromGallery({required int? maxByte}) async {
    final XFile? xfile = await imagePickerRepository.pickVideoFromGallery();

    if (xfile == null) {
      return null;
    }

    File file = File(xfile.path);

    if (maxByte != null) {
      if (await calculateFileSize(file) > maxByte) {
        return MediaModel(file: null);
      }
    }

    return MediaModel(file: file);
  }
}
