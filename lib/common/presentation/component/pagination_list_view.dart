import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

typedef PaginationWidgetBuilder = Widget Function(int index);

class PaginationListview extends ConsumerStatefulWidget {
  final PaginationWidgetBuilder paginationWidgetBuilder;

  const PaginationListview({
    super.key,
    required this.paginationWidgetBuilder,
  });

  @override
  ConsumerState<PaginationListview> createState() => _FeedScreenScaffoldState();
}

class _FeedScreenScaffoldState extends ConsumerState<PaginationListview> {
  @override
  Widget build(BuildContext context) {
    const int itemCount = 360;

    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        final bool isScrolEnd = notification is ScrollEndNotification &&
            notification.metrics.pixels == notification.metrics.maxScrollExtent;

        if (isScrolEnd) {
          debugPrint("끝 도착! 페이지네이션 요청");
          return true;
        }

        return true;
      },
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return widget.paginationWidgetBuilder(index);
        },
      ),
    );
  }
}
