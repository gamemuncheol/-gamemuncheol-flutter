import 'dart:io';

import 'package:gamemuncheol/common/util/result.dart';
import 'package:gamemuncheol/feature/feed/repository/feed_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:gamemuncheol/common/model/data_state.dart';

part 'upload_video_provider.g.dart';

@riverpod
class UploadVideoNotifer extends _$UploadVideoNotifer {
  @override
  Ds<File> build() => Ds<File>(state: DataState.initial);

  Future<void> uploadVideo() async {
    state = Loading("동영상 업로드 중..");

    Result<File> file = await ref.read(feedRepositoryProvider).uploadVideo();

    switch (file) {
      case Success<File>():
        state = Loaded(file.data);
        break;

      case Failure():
        state = Error(file.error);
        break;
    }
  }
}
