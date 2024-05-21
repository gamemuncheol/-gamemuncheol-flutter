import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/media_model.dart';
import 'package:gamemuncheol/common/service/image_picker/image_picker_repository.dart';

part 'image_picker_service.g.dart';

@riverpod
ImagePickerService imagePickerService(ImagePickerServiceRef ref) {
  final ImagePickerRepository imagePickerRepository =
      ref.read(imagePickerRepositoryProvider);
  return ImagePickerServiceImpl(imagePickerRepository: imagePickerRepository);
}

abstract class ImagePickerService {
  Future<MediaModel?> pickImageFromGallery({required int? maxByte});
  Future<MediaModel?> pickVideoFromGallery({required int? maxByte});
}

class ImagePickerServiceImpl implements ImagePickerService {
  final ImagePickerRepository _imagePickerRepository;

  ImagePickerServiceImpl({required ImagePickerRepository imagePickerRepository})
      : _imagePickerRepository = imagePickerRepository;

  @override
  Future<MediaModel?> pickImageFromGallery({required int? maxByte}) async {
    final XFile? xfile = await _imagePickerRepository.pickImageFromGallery();
    return _makeMediaModel(xFile: xfile, maxByte: maxByte);
  }

  @override
  Future<MediaModel?> pickVideoFromGallery({required int? maxByte}) async {
    final XFile? xfile = await _imagePickerRepository.pickVideoFromGallery();
    return _makeMediaModel(xFile: xfile, maxByte: maxByte);
  }

  Future<double> _calculateFileSize(File file) async {
    final int fileSizeInBytes = await file.length();
    final double fileSizeInMB = fileSizeInBytes / (1024 * 1024);

    return fileSizeInMB;
  }

  Future<MediaModel?> _makeMediaModel({XFile? xFile, int? maxByte}) async {
    if (xFile == null) {
      return null;
    }

    final File file = File(xFile.path);
    if (maxByte != null) {
      if (await _calculateFileSize(file) > maxByte) {
        return MediaModel(file: null);
      }
    }

    return MediaModel(file: file);
  }
}
