// ignore_for_file: constant_identifier_names, depend_on_referenced_packages, implementation_imports

import 'package:flutter/material.dart';
import 'package:gamemuncheol/common/presentation/component/app_dialog.dart';
import 'package:riverpod/src/framework.dart';

import 'package:gamemuncheol/common/extension/preferred_sized_widget.dart';
import 'package:gamemuncheol/common/presentation/layout/base_screen_v2.dart';
import 'package:gamemuncheol/feature/feed/presentation/provider/create_feed_provider.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_creation_screen_app_bar.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_creation_screen_header.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_creation_screen_next_button.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_form.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/feed_tag.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/component/thumb_image.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/create_feed_screen_shared_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/event/enter_feed_form_screen_event.dart';
import 'package:gamemuncheol/feature/feed/presentation/view/create/screen/feed_form_screen_layout.dart';

class FeedFormScreen extends BaseScreenV2 {
  const FeedFormScreen({super.key});

  static const PATH = "/$NAME";
  static const NAME = "FEED_FORM_SCREEN";

  @override
  BaseScreenV2State<FeedFormScreen> createState() =>
      _EnterFeedFormScreenV2State();
}

class _EnterFeedFormScreenV2State extends BaseScreenV2State<FeedFormScreen>
    with BlurLayout, CreateFeedScreenSharedEvent, FeedFormScreenState {
  @override
  ProviderListenable get provider => createFeedNotifierProvider;

  @override
  Widget Function(String erMessage, VoidCallback onSignleButtonTap) get dialog {
    return (String erMessage, VoidCallback onSignleButtonTap) {
      return AppDialog.singleButton(
          title: "업로드 실패",
          description: erMessage,
          onSignleButtonTap: onSignleButtonTap);
    };
  }

  @override
  PreferredSizeWidget? buildAppBar() {
    return CreateFeedScreenAppBar.step4(
      onLeadingTap: onLeadingTap,
    ).toAppBar();
  }

  @override
  Widget buildBody() {
    listenError();

    return EnterFeedFormScreenLayout(
      bottomButton: _buildSubmitBtn(),
      header: _buildHeader(),
      thumbImage: _buildThumbImg(),
      form: _buildFeedForm(),
      tags: _buildTagFiled(),
    );
  }

  Widget _buildHeader() {
    const String title = "구체적인 정보를 입력해\n주세요.";

    return const CreateFeedScreenHeader(
      title: title,
    );
  }

  Widget _buildFeedForm() {
    return FeedForm(
        formKey: formKey,
        titleController: titleController,
        descriptionController: descriptionController);
  }

  Widget _buildSubmitBtn() {
    return CreateFeedScreenNextButton(onTap: onNextButtonTap);
  }

  Widget _buildThumbImg() {
    return ThumbImage.thumbImageChangeButton(
      onTap: changeThumbImage,
    );
  }

  Widget _buildTagFiled() {
    return FeedTag(
        tags: tags,
        addTag: addTag,
        removeTag: removeTag,
        updateOverlay: updateOverlay);
  }
}
