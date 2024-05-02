import 'dart:io';
import 'dart:typed_data';

import 'package:gamemuncheol/common/model/common_response.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/common_error.dart';
import 'package:gamemuncheol/common/util/result.dart';
import 'package:gamemuncheol/feature/feed/model/match_history.dart';
import 'package:gamemuncheol/feature/feed/repository/feed_api.dart';
import 'package:gamemuncheol/feature/feed/model/feed_error.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

part 'feed_repository.g.dart';

@riverpod
FeedRepository feedRepository(FeedRepositoryRef ref) {
  final FeedApi feedApi = ref.read(feedApiProvider);
  return FeedRepositoryImpl(feedApi: feedApi);
}

abstract class FeedRepository {
  Future<Result<MatchHistory>> search(String gameId);
  Future<Result<File>> uploadVideo();
  Future<Result<Uint8List>> extractThumbNail({required File videoFile});
  Future<Result<Uint8List>> changeThumbNail();
}

class FeedRepositoryImpl implements FeedRepository {
  final FeedApi feedApi;

  FeedRepositoryImpl({required this.feedApi});

  @override
  Future<Result<MatchHistory>> search(String gameId) async {
    try {
      final CommonResponse<MatchHistory> matchHistory =
          await feedApi.search(gameId);
      return Success(matchHistory.data!);
    } catch (e) {
      return Failure(NoSuchMatchHistory());
    }
  }

  @override
  Future<Result<File>> uploadVideo() async {
    try {
      final XFile? xfile = await ImagePicker().pickVideo(
        source: ImageSource.gallery,
      );

      if (xfile == null) {
        return Failure(VideoNotSelected());
      }

      File file = File(xfile.path);

      int fileSizeInBytes = await file.length();
      double fileSizeInMB = fileSizeInBytes / (1024 * 1024);

      if (fileSizeInMB > 500) {
        return Failure(ByteOverFlow());
      }

      return Success(file);
    } catch (e) {
      return Failure(UnKnown());
    }
  }

  @override
  Future<Result<Uint8List>> changeThumbNail() async {
    try {
      final XFile? xfile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (xfile == null) {
        return Failure(ThumbNailNotSelected());
      }

      final File file = File(xfile.path);
      final Uint8List bytes = file.readAsBytesSync();

      return Success(bytes);
    } catch (e) {
      return Failure(UnKnown());
    }
  }

  @override
  Future<Result<Uint8List>> extractThumbNail({required File videoFile}) async {
    try {
      final Uint8List? uint8List =
          await VideoThumbnail.thumbnailData(video: videoFile.path);

      if (uint8List == null) {
        return Failure(ThumbNailInitializeFailed());
      }

      return Success(uint8List);
    } catch (e) {
      return Failure(ThumbNailInitializeFailed());
    }
  }
}
