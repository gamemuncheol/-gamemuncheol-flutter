import 'dart:io' hide HttpResponse;
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:retrofit/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

import 'package:gamemuncheol/common/model/base_error.dart';
import 'package:gamemuncheol/common/model/media_model.dart';
import 'package:gamemuncheol/common/model/result.dart';
import 'package:gamemuncheol/common/service/image_picker/image_picker_service.dart';
import 'package:gamemuncheol/common/util/url_parser.dart';
import 'package:gamemuncheol/feature/feed/model/feed.dart';
import 'package:gamemuncheol/feature/feed/model/feed_error.dart';
import 'package:gamemuncheol/feature/feed/model/feed_form.dart';
import 'package:gamemuncheol/feature/feed/model/match.dart';
import 'package:gamemuncheol/feature/feed/model/video_model.dart';
import 'package:gamemuncheol/feature/feed/repository/feed_api.dart';

part 'feed_service.g.dart';

@riverpod
FeedService feedService(FeedServiceRef ref) {
  final FeedApi feedApi = ref.read(feedApiProvider);
  final ImagePickerService imagePickerService =
      ref.read(imagePickerServiceProvider);

  return FeedService(
    feedApi: feedApi,
    imagePickerService: imagePickerService,
  );
}

class FeedService {
  final FeedApi _feedApi;
  final ImagePickerService _imagePickerService;

  FeedService({
    required FeedApi feedApi,
    required ImagePickerService imagePickerService,
  })  : _feedApi = feedApi,
        _imagePickerService = imagePickerService;

  // 전적 검색
  Future<Result<Match>> search(String gameId) async {
    try {
      return Success(
        (await _feedApi.search(gameId)).data!,
      );
    } catch (e) {
      return const Failure(
        FeedError.NO_SUCH_MATCH,
      );
    }
  }

  // 동영상(파일, 유튜브 URL용은 따로 있음)에서 썸네일 추출
  // 패키지 쓰기 아까우니까 시간날 때 패키지 코드 배끼기 기억 or VideoThumbnail 클래스 추상화해야 함 기억
  Future<Result<Uint8List>> _getByteThumbImage(File videoFile) async {
    try {
      final uint8List =
          await VideoThumbnail.thumbnailData(video: videoFile.path);

      if (uint8List == null) {
        return const Failure(
          FeedError.THUMB_IMAGE_INITIALIZE_FAILED,
        );
      }

      return Success(uint8List);
    } catch (e) {
      return const Failure(
        FeedError.THUMB_IMAGE_INITIALIZE_FAILED,
      );
    }
  }

  // 동영상 선택
  Future<Result<File>> _selectVideo() async {
    try {
      // 1. 동영상 선택
      final MediaModel? mediaModel =
          await _imagePickerService.pickVideoFromGallery(maxByte: 500);

      // 2. 아무것도 선택하지 않은 경우 FeedError 리턴
      if (mediaModel == null) {
        return const Failure(
          FeedError.VIDEO_NOT_SELECTED,
        );

        // 3. 선택은 했는데 용량이 커서 담을 수 없는 경우도 FeedError 리턴
      } else if (mediaModel.file == null) {
        return const Failure(
          FeedError.BYTE_OVER_FLOW,
        );
      }

      return Success(mediaModel.file!);
    } catch (e) {
      return const Failure(
        FeedError.UNSUPPORTED_FILE,
      );
    }
  }

  // 동영상은 한 번 고르면 잘 바꾸지 않으니 선택과 동시에 업로드
  Future<Result<VideoModel>> uploadVideo() async {
    try {
      // 1. 동영상 선택
      return _selectVideo().then(
        (videoFile) => videoFile.when(
          success: (videoFile) async {
            // 2. 동영상 업로드
            final videoUrl = await _feedApi.uploadVideo(videoFile);
            // 3. 썸네일 추출
            final byteThumbImage = await _getByteThumbImage(videoFile);

            return byteThumbImage.when(
              // 4. 동영상 선택, 업로드, 썸네일 추출까지 성공
              success: (byteThumbImage) => Success(VideoModel(
                videoUrl: videoUrl,
                byteThumbImage: byteThumbImage,
              )),
              //
              // 5. 동영상 선택, 업로드만 성공
              failure: (e) => Success(VideoModel(
                videoUrl: videoUrl,
                byteThumbImage: null,
              )),
            );
          },
          failure: (e) {
            return Failure(e);
          },
        ),
      );
    } catch (e) {
      return const Failure(
        FeedError.UNSUPPORTED_FILE,
      );
    }
  }

  // 유튜브 URL 입력
  Future<Result<VideoModel>> enterYoutubeUrl(String youtubeUrl) async {
    // 1. URL -> ID로 변환
    final String? youtubeId = UrlUtil.urlToYoutubeId(youtubeUrl);
    // 2. ID가 없으면 FeedError 반환
    if (youtubeId == null) {
      return const Failure(
        FeedError.NO_SUCH_YOUTUBE_URL,
      );
    }

    // 3. ID가 있으면 유튜브 썸네일 추출
    try {
      final List<int>? intList =
          await _getYoutubeThumbImage(youtubeId).then((value) => value.when(
                success: (intList) => intList.data,
                failure: (error) => null,
              ));

      // 4. 썸네일 추출이 안 되면 양식만 유튜브 URL 양식이고 영상은 없는 경우임
      if (intList == null) {
        return const Failure(
          FeedError.NO_SUCH_YOUTUBE_URL,
        );
      }

      return Success(
        VideoModel(
          videoUrl: youtubeId,
          byteThumbImage: Uint8List.fromList(
            intList,
          ),
        ),
      );
    } catch (e) {
      return const Failure(
        FeedError.NO_SUCH_YOUTUBE_URL,
      );
    }
  }

  // 유튜브 썸네일 추출
  Future<Result<HttpResponse<List<int>>>> _getYoutubeThumbImage(
      String youtubeId) async {
    try {
      final HttpResponse<List<int>> thumbImageFile =
          await _feedApi.getYoutubeThumbImage(youtubeId);

      return Success(thumbImageFile);
    } catch (e) {
      return const Failure(
        FeedError.NO_SUCH_YOUTUBE_URL,
      );
    }
  }

  // 썸네일 변경
  Future<Result<Uint8List>> changeThumbImage() async {
    try {
      // 1. 이미지 선택
      final MediaModel? mediaModel =
          await _imagePickerService.pickImageFromGallery(maxByte: null);

      // 2. 아무것도 선택하지 않은 경우 FeedError 리턴
      if (mediaModel == null) {
        return const Failure(
          FeedError.THUMB_IMAGE_NOT_SELECTED,
        );
      }

      // 3. 바이트로 변환 및 반환
      final Uint8List bytes = mediaModel.file!.readAsBytesSync();
      return Success(bytes);
    } catch (e) {
      return const Failure(
        FeedError.UNSUPPORTED_FILE,
      );
    }
  }

  // 피드 업로드
  Future<Result<Feed>> post({
    required String videoUrl,
    required Uint8List thumbImageFile,
    required String title,
    required String content,
    required List<int> matchUserIds,
    required List<String> tags,
  }) async {
    // 1. 썸네일 파일 먼저 업로드해서 URL 받고,
    final Result<String> thumbImageUrl =
        await _uploadThumbImage(thumbImageFile);

    return thumbImageUrl.when(
      success: (thumbImageUrl) async {
        // 2. BODY로 보낼 FeedForm 객체 생성
        final feedForm = FeedForm(
          videoUrl: videoUrl,
          thumbnailUrl: thumbImageUrl,
          title: title,
          content: content,
          matchUserIds: matchUserIds,
          tags: tags,
        );

        try {
          final feed = await _feedApi.post(feedForm);
          return Success(
            feed.data!,
          );
        } catch (e) {
          return const Failure(
            CommonError.UN_KNOWN,
          );
        }
      },
      failure: (e) {
        return Failure(e);
      },
    );
  }

  // 썸네일 업로드
  // 썸네일은 유저가 자주 바꿀 수도 있으니
  // 마지막 업로드할 때 한 번만 업로드
  Future<Result<String>> _uploadThumbImage(Uint8List byteThumbImage) async {
    try {
      // 1. 파일 경로 지정
      final filePath = '${(await getTemporaryDirectory()).path}/tempo.jpg';
      // 2. 파일 생성
      final thumbImageFile = File(filePath);
      // 3 파일에 이미지 쓰기
      final thumbImageFileWritten =
          await thumbImageFile.writeAsBytes(byteThumbImage);
      // 4. 서버에 업로드
      final thumbImageUrl =
          await _feedApi.uploadThumbImage(thumbImageFileWritten);

      return Success(
        thumbImageUrl,
      );
    } catch (e) {
      return const Failure(
        FeedError.UNSUPPORTED_FILE,
      );
    }
  }
}
