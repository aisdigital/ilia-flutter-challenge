import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PullToRefreshInfiniteList extends StatefulWidget {
  const PullToRefreshInfiniteList({
    super.key,
    required this.itemBuilder,
    required this.onRefresh,
    required this.itemCount,
    required this.loadNext,
    this.scrollController,
  });

  final ScrollController? scrollController;
  final Widget? Function(BuildContext, int) itemBuilder;
  final Future<void> Function() onRefresh;
  final Future<bool> Function()? loadNext;
  final int itemCount;

  @override
  State<PullToRefreshInfiniteList> createState() =>
      _PullToRefreshInfiniteListState();
}

class _PullToRefreshInfiniteListState extends State<PullToRefreshInfiniteList> {
  bool _loading = false;

  onNotificationScroll(double maxScrollExtent, double pixels) async {
    var nextPageTrigger = 0.95 * maxScrollExtent;
    if (pixels > nextPageTrigger && !_loading) {
      _loading = true;
      if (widget.loadNext != null) _loading = !(await widget.loadNext!());
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          onNotificationScroll(
            notification.metrics.maxScrollExtent,
            notification.metrics.pixels,
          );
          return true;
        },
        child: Platform.isIOS
            ? CustomScrollView(
                controller: widget.scrollController,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                slivers: [
                  CupertinoSliverRefreshControl(
                    onRefresh: widget.onRefresh,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      widget.itemBuilder,
                      childCount: widget.itemCount,
                    ),
                  ),
                  if (_loading)
                    const SliverToBoxAdapter(
                      child: Center(
                          child: Padding(
                        padding: EdgeInsets.all(8),
                        child: CircularProgressIndicator(),
                      )),
                    )
                ],
              )
            : RefreshIndicator(
                onRefresh: widget.onRefresh,
                child: SizedBox.expand(
                  child: ListView.builder(
                    controller: widget.scrollController,
                    itemCount: widget.itemCount,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: widget.itemBuilder,
                  ),
                ),
              ));
  }
}
