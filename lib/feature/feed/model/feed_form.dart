import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_form.g.dart';
part 'feed_form.freezed.dart';

@Freezed(toJson: true)
class FeedForm with _$FeedForm {
  const factory FeedForm({
    required String videoUrl,
    required String thumbnailUrl,
    required String title,
    required String content,
    required List<int> matchUserIds,
    required List<String> tags,
  }) = _FeedForm;

  factory FeedForm.fromJson(Map<String, dynamic> json) =>
      _$FeedFormFromJson(json);
}
