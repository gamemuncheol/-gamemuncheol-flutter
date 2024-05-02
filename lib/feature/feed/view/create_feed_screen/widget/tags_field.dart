import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gamemuncheol/feature/feed/view/create_feed_screen/mixin/enter_feed_form_screen_event.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class TagsField extends HookConsumerWidget with EnterFeedFormScreenEvent {
  TagsField({super.key});

  final LayerLink layerLink = LayerLink();
  OverlayEntry? overlayEntry;

  void removeOverlay() {
    if (overlayEntry != null) {
      overlayEntry!.remove();
      overlayEntry = null;
    }
  }

  void updateOverlay(
    BuildContext context, {
    required TextEditingController controller,
    required ValueNotifier<List<TagModel>> tags,
  }) {
    removeOverlay();

    if (controller.text.isEmpty) {
      return;
    }

    overlayEntry = OverlayEntry(
      builder: (context) {
        return Positioned(
          width: MediaQuery.sizeOf(context).width - 24,
          child: CompositedTransformFollower(
            link: layerLink,
            offset: const Offset(0, 48),
            child: Material(
              elevation: 1,
              child: GestureDetector(
                onTap: () {
                  final TagModel tagModel = TagModel(
                    id: (tags.value.length + 1).toString(),
                    title: controller.value.text.trim(),
                  );

                  addTag(tagModel: tagModel, tags: tags);
                  removeOverlay();
                  controller.clear();
                },
                child: ListTile(title: Text(controller.text)),
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context).insert(overlayEntry!);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = useTextEditingController();
    final ValueNotifier<List<TagModel>> tags = useState([]);

    useEffect(() {
      controller.addListener(() {
        updateOverlay(context, controller: controller, tags: tags);
      });

      return () {
        controller.removeListener(() => updateOverlay);
        controller.dispose();
        removeOverlay();
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
              buildTextField(controller: controller),
              if (tags.value.isNotEmpty) buildSelectedTags(tags: tags),
            ],
          ),
        ),
      ],
    );
  }

  Padding buildSelectedTags({
    required ValueNotifier<List<TagModel>> tags,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          Wrap(
            alignment: WrapAlignment.start,
            children: tags.value
                .map((tagModel) => buildTagChip(
                      tagModel: tagModel,
                      removeTag: () =>
                          removeTag(tags: tags, tagModel: tagModel),
                    ))
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.cyan),
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            tagModel.title,
            style: const TextStyle(color: Colors.black, fontSize: 15.0),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: Colors.orange.shade600,
            radius: 8.0,
            child: const Icon(
              Icons.clear,
              size: 10.0,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget buildTextField({required TextEditingController controller}) {
    return Container(
      margin: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 20.0,
        bottom: 5.0,
      ),
      child: CompositedTransformTarget(
        link: layerLink,
        child: TextFormField(controller: controller),
      ),
    );
  }
}

class TagModel {
  String id;
  String title;

  TagModel({
    required this.id,
    required this.title,
  });
}
