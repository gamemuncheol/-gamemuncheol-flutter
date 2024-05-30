import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/presentation/view/home/home_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/change_thumb_image_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/create_feed_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/match_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/video_upload_provider.dart';
import 'package:go_router/go_router.dart';

import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/common/service/form_validator.dart';
import 'package:gamemuncheol/feature/feed/model/tag.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/change_thumb_image_screen.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/create_feed_screen_shared_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/feed_form_screen.dart';

mixin FeedFormScreenState
    on BaseScreenV2State<FeedFormScreen>, CreateFeedScreenSharedEvent {
  // 폼 키
  final GlobalKey<FormState> formKey = GlobalKey();

  // 제목 컨트롤러
  final TextEditingController titleController = TextEditingController();

  // 본문 컨트롤러
  final TextEditingController descriptionController = TextEditingController();

  // 태그
  late final ValueNotifier<List<Tag>> tags = ValueNotifier([]);

  // 다일얼로그
  Widget Function(String erMessage, VoidCallback onSignleButtonTap) get dialog;

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    tags.dispose();
    super.dispose();
  }

  // 리딩 이벤트
  // 뒤로가기
  void onLeadingTap() => context.pop();

  // 폼 제출 메소드
  // 폼 벨리데이션, 폼 제출
  void onNextButtonTap() {
    FormValidator.submitForm(
      formKey,
      whenValid: () async {
        ref
            .read(createFeedNotifierProvider.notifier)
            .post(
              videoUrl: ref
                  .read(videoUploadNotifierProvider)
                  .pState
                  .videoModel
                  .videoUrl,
              thumbImageFile:
                  ref.read(changeThumbImageNotifierProvider).pState.data,
              title: titleController.text.trim(),
              content: descriptionController.text.trim(),
              matchUserIds: [
                ref.read(matchNotiferProvider).pState.myself.id,
                ref.read(matchNotiferProvider).pState.stakeHolder.id,
              ].toList(),
              tags: tags.value.map((e) => e.content).toList(),
            )
            .then((value) {
          if (value) {
            context.go(HomeScreen.PATH);
          }
        });
      },
    );
  }

  void listenError() {
    ref.listen(
      createFeedNotifierProvider,
      (previous, next) {
        if (next.isError) {
          show(
            content: dialog(next.erMessage, context.pop),
          );
        }
      },
    );
  }

  // 썸네일 변경 화면으로 이동
  // 가기 전 권한 확인!
  void changeThumbImage() async {
    await checkPermission().then(
        (value) => context.push(ChangeThumbImageScreen.PATH, extra: value));
  }

  // 태그 자동완성
  void updateOverlay({
    required ValueNotifier<OverlayEntry?> overlayEntry,
    required TextEditingController tagFieldController,
    required GlobalKey tagFieldKey,
    required LayerLink layerLink,
    required VoidCallback onTap,
  }) {
    if (overlayEntry.value != null) {
      overlayEntry.value?.remove();
    }

    if (tagFieldController.text.trim().isEmpty) {
      overlayEntry.value = null;
      return;
    }

    final RenderBox renderBox =
        tagFieldKey.currentState?.context.findRenderObject() as RenderBox;
    final Size size = renderBox.size;

    final newOverlay = OverlayEntry(builder: (context) {
      return Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          offset: Offset(0, size.height),
          child: Material(
            elevation: 4.0,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.white,
                child: Text(
                  tagFieldController.text,
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
      );
    });

    overlayEntry.value = newOverlay;
    Overlay.of(context).insert(overlayEntry.value!);
  }

  void removeTag({
    required ValueNotifier<List<Tag>> tags,
    required int tagId,
  }) {
    final List<Tag> newTags = List.from(tags.value);
    newTags.remove(tags.value.where((e) => e.id == tagId).first);
    tags.value = newTags;
  }

  void addTag({
    required ValueNotifier<List<Tag>> tags,
    required Tag newTag,
  }) {
    final List<Tag> newTags = List.from(tags.value);
    newTags.add(newTag);
    tags.value = newTags;
  }
}
