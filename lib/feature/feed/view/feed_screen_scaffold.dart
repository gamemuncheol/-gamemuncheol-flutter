import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

typedef PaginationWidgetBuilder = Widget Function(int index);

class FeedScreenScaffold extends ConsumerStatefulWidget {
  // 탭 이름
  final String tab;

  // 로드할 위젯
  final PaginationWidgetBuilder paginationWidgetBuilder;

  const FeedScreenScaffold({
    super.key,
    required this.tab,
    required this.paginationWidgetBuilder,
  });

  @override
  ConsumerState<FeedScreenScaffold> createState() => _FeedScreenScaffoldState();
}

class _FeedScreenScaffoldState extends ConsumerState<FeedScreenScaffold> {
  @override
  Widget build(BuildContext context) {
    const int itemCount = 360;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollEndNotification &&
            notification.metrics.pixels ==
                notification.metrics.maxScrollExtent) {
          debugPrint("끝${widget.tab}");
          return true;
        }
        return true;
      },
      child: ListView.builder(
        key: PageStorageKey<String>(
          widget.tab,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return widget.paginationWidgetBuilder(
            index,
          );
        },
      ),
    );
  }
}
