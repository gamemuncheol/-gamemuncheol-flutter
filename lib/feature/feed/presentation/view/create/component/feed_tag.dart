import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/presentation/component/custom_text_form_filed.dart';
import 'package:gamemuncheol/common/util/theme_util.dart';
import 'package:gamemuncheol/feature/feed/model/tag.dart';

class FeedTag extends StatefulWidget {
  final ValueNotifier<List<Tag>> tags;

  final void Function({
    required ValueNotifier<List<Tag>> tags,
    required Tag newTag,
  }) addTag;

  final void Function({
    required ValueNotifier<List<Tag>> tags,
    required int tagId,
  }) removeTag;

  final void Function({
    required ValueNotifier<OverlayEntry?> overlayEntry,
    required TextEditingController tagFieldController,
    required GlobalKey tagFieldKey,
    required LayerLink layerLink,
    required VoidCallback onTap,
  }) updateOverlay;

  const FeedTag({
    super.key,
    required this.tags,
    required this.addTag,
    required this.removeTag,
    required this.updateOverlay,
  });

  @override
  FeedTagState createState() => FeedTagState();
}

class FeedTagState extends State<FeedTag> with ThemeProvider {
  late GlobalKey tagFieldKey;
  final LayerLink layerLink = LayerLink();
  late TextEditingController tagFieldController;
  final ValueNotifier<OverlayEntry?> overlayEntry =
      ValueNotifier<OverlayEntry?>(null);

  @override
  void initState() {
    super.initState();
    tagFieldKey = GlobalKey();
    tagFieldController = TextEditingController();
    tagFieldController.addListener(updateOverlay);
  }

  @override
  void dispose() {
    tagFieldController.removeListener(updateOverlay);
    tagFieldController.dispose();
    overlayEntry.value?.remove();
    overlayEntry.dispose();
    super.dispose();
  }

  void updateOverlay() {
    widget.updateOverlay(
      layerLink: layerLink,
      tagFieldKey: tagFieldKey,
      overlayEntry: overlayEntry,
      tagFieldController: tagFieldController,
      onTap: () {
        final String currentContent = tagFieldController.text.trim();

        final bool isDuplicated = widget.tags.value
                .where((e) => e.content == currentContent)
                .firstOrNull !=
            null;

        if (isDuplicated) {
          removeOverlay();
          return;
        }

        final int id =
            widget.tags.value.isEmpty ? 1 : widget.tags.value.last.id + 1;

        widget.addTag(
          tags: widget.tags,
          newTag: Tag(
            id: id,
            content: tagFieldController.text.trim(),
          ),
        );

        removeOverlay();
      },
    );
  }

  void removeOverlay() {
    overlayEntry.value?.remove();
    overlayEntry.value = null;
    tagFieldController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTextField(
                tagFieldKey: tagFieldKey,
                controller: tagFieldController,
                onFocusOut: () {
                  overlayEntry.value?.remove();
                  overlayEntry.value = null;
                },
              ),
              ValueListenableBuilder(
                valueListenable: widget.tags,
                builder: (context, value, child) {
                  return Visibility(
                    visible: widget.tags.value.isNotEmpty,
                    child: buildSelectedTags(tags: widget.tags),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildTextField({
    required GlobalKey tagFieldKey,
    required TextEditingController controller,
    required VoidCallback onFocusOut,
  }) {
    const String hintText = "태그를 입력해 주세요.";

    return CompositedTransformTarget(
      link: layerLink,
      child: Focus(
        onFocusChange: (value) {
          if (!value) {
            onFocusOut();
          }
        },
        child: Stack(
          children: [
            CustomTextFormField(
              fieldKey: tagFieldKey,
              textEditingController: controller,
              inputDeco: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                fillColor: colorTheme.natural02,
                filled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSelectedTags({
    required ValueNotifier<List<Tag>> tags,
  }) {
    final double horizontalPadding = 12.w;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            children: tags.value
                .map((tagModel) {
                  return buildTagChip(
                    tagModel: tagModel,
                    removeTag: () {
                      widget.removeTag(tags: tags, tagId: tagModel.id);
                    },
                  );
                })
                .toSet()
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget buildTagChip({
    required Tag tagModel,
    required VoidCallback removeTag,
  }) {
    final margin = EdgeInsets.only(right: 16.w, top: 24.h);
    final padding = EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h);

    final chipDeco = BoxDecoration(
      border: Border.all(color: colorTheme.primaryBlue),
      borderRadius: BorderRadius.circular(100),
    );

    final TextStyle contentStyle =
        textStyleTheme.body4R.copyWith(color: colorTheme.primaryBlue);

    return GestureDetector(
      onTap: removeTag,
      child: Container(
        margin: margin,
        padding: padding,
        decoration: chipDeco,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              tagModel.content,
              style: contentStyle,
            ),
            Gap(10.w),
            CircleAvatar(
              radius: 8,
              backgroundColor: colorTheme.primaryBlue,
              child: SvgPicture.asset(AppAsset.CLOSE_WHITE),
            ),
          ],
        ),
      ),
    );
  }
}
