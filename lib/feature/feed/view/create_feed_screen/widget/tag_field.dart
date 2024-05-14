import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gamemuncheol/common/const/assets.dart';
import 'package:gamemuncheol/common/const/colors.dart';
import 'package:gamemuncheol/common/service/theme_service.dart';
import 'package:gamemuncheol/common/util/gap.dart';
import 'package:gamemuncheol/common/presentation/widget/custom_text_form_filed.dart';
import 'package:gamemuncheol/feature/feed/model/tag_model.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TagField extends HookWidget with ThemeServiceProvider {
  final void Function(
    BuildContext context, {
    required ValueNotifier<OverlayEntry?> overlayEntry,
    required TextEditingController tagFieldController,
    required GlobalKey tagFieldKey,
    required LayerLink layerLink,
    required VoidCallback onTap,
  }) updateOverlay;

  final void Function({
    required ValueNotifier<List<TagModel>> tags,
    required TagModel newTag,
  }) addTag;

  final void Function({
    required ValueNotifier<List<TagModel>> tags,
    required String tagId,
  }) removeTag;

  TagField({
    super.key,
    required this.updateOverlay,
    required this.addTag,
    required this.removeTag,
  });

  final LayerLink layerLink = LayerLink();
  final GlobalKey tagFieldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<List<TagModel>> tags = useState([]);
    final overlayEntry = useState<OverlayEntry?>(null);

    final tagFieldController = useTextEditingController();

    useEffect(() {
      void removeOverlay() {
        overlayEntry.value?.remove();
        overlayEntry.value = null;
        tagFieldController.clear();
      }

      void updateOverlay() {
        this.updateOverlay(
          context,
          layerLink: layerLink,
          tagFieldKey: tagFieldKey,
          overlayEntry: overlayEntry,
          tagFieldController: tagFieldController,
          onTap: () {
            final String currentContent = tagFieldController.text.trim();

            final bool isDuplicated = tags.value
                    .where((e) => e.content == currentContent)
                    .firstOrNull !=
                null;

            if (isDuplicated) {
              removeOverlay();
              return;
            }

            final String id =
                (int.parse(tags.value.isEmpty ? "1" : tags.value.last.id) + 1)
                    .toString();

            addTag(
              tags: tags,
              newTag: TagModel(id: id, content: tagFieldController.text.trim()),
            );

            removeOverlay();
          },
        );
      }

      tagFieldController.addListener(updateOverlay);

      return () {
        tagFieldController.removeListener(updateOverlay);
        tagFieldController.dispose();
        if (overlayEntry.value != null) {
          overlayEntry.value!.remove();
        }
      };
    }, []);

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
              if (tags.value.isNotEmpty) buildSelectedTags(tags: tags),
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
    return CompositedTransformTarget(
      link: layerLink,
      child: Focus(
        onFocusChange: (value) {
          if (!value) {
            onFocusOut();
          }
        },
        child: CustomTextFormField(
          fieldKey: tagFieldKey,
          textEditingController: controller,
          inputDeco: const InputDecoration(
            border: InputBorder.none,
            fillColor: AppColor.natural02,
            filled: true,
          ),
        ),
      ),
    );
  }

  Widget buildSelectedTags({
    required ValueNotifier<List<TagModel>> tags,
  }) {
    final padding = EdgeInsets.symmetric(horizontal: 12.w);

    return Padding(
      padding: padding,
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            children: tags.value
                .map((tagModel) {
                  return buildTagChip(
                    tagModel: tagModel,
                    removeTag: () => removeTag(tags: tags, tagId: tagModel.id),
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
    required TagModel tagModel,
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
            Text(tagModel.content, style: contentStyle),
            const Gap(10).setWidth(),
            SvgPicture.asset(AppAsset.closeWhite),
          ],
        ),
      ),
    );
  }
}
