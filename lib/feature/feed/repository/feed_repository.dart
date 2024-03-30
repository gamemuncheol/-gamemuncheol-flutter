import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/common_error.dart';
import 'package:gamemuncheol/common/util/result.dart';
import 'package:gamemuncheol/feature/feed/model/match_history.dart';
import 'package:gamemuncheol/feature/feed/repository/feed_api.dart';
import 'package:gamemuncheol/feature/feed/model/feed_error.dart';

part 'feed_repository.g.dart';

@riverpod
FeedRepository feedRepository(FeedRepositoryRef ref) {
  final FeedApi feedApi = ref.read(feedApiProvider);

  return FeedRepositoryImpl(
    feedApi: feedApi,
  );
}

abstract class FeedRepository {
  Future<Result<MatchHistory>> search({
    required String gameId,
  });

  Future<Result<File>> uploadVideo();
}

class FeedRepositoryImpl implements FeedRepository {
  final FeedApi feedApi;

  FeedRepositoryImpl({
    required this.feedApi,
  });

  @override
  Future<Result<MatchHistory>> search({
    required String gameId,
  }) async {
    try {
      final MatchHistory matchHistory = await feedApi.search(
        gameId: gameId,
      );

      return Success(matchHistory);
    } catch (e) {
      return Failure(UnKnown());
    }
  }

  @override
  Future<Result<File>> uploadVideo() async {
    try {
      final XFile? xfile = await ImagePicker().pickVideo(
        source: ImageSource.gallery,
      );

      if (xfile == null) {
        return Failure(FileNotSelected());
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
}
