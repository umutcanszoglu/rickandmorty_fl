import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty_fl/utils/paginated.dart';

class PaginatedList<T> extends StatelessWidget {
  const PaginatedList({
    super.key,
    required this.paginated,
    required this.itemBuilder,
    this.axis = Axis.vertical,
    this.physics = const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
    this.loading,
    this.itemExtent,
    this.padding,
    this.empty,
    this.scrollController,
    this.shrinkWrap = true,
    this.onRefresh,
    this.skip = 0,
  });

  final Paginated<T> paginated;

  final Widget? loading;
  final Widget? empty;
  final Axis axis;
  final ScrollPhysics physics;
  final Widget Function(BuildContext context, int index, T item) itemBuilder;
  final EdgeInsets? padding;
  final double? itemExtent;
  final bool shrinkWrap;
  final ScrollController? scrollController;
  final Function()? onRefresh;
  final int skip;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (paginated.isLoading.value || !paginated.initialized) {
          return Center(child: loading ?? const CircularProgressIndicator());
        }
        if (paginated.items.isEmpty) {
          return empty ?? Text("empty".tr);
        }
        return RefreshIndicator(
          onRefresh: () async {
            if (onRefresh != null) {
              onRefresh!();
            } else {
              await paginated.freshFetch();
            }
          },
          child: ListView.builder(
            controller: scrollController,
            itemExtent: itemExtent,
            scrollDirection: axis,
            physics: physics,
            itemCount: paginated.listLength - skip,
            padding: padding,
            shrinkWrap: shrinkWrap,
            itemBuilder: (ctx, idx) {
              if ((idx + skip) < paginated.items.length) {
                return itemBuilder(ctx, idx, paginated.items[idx + skip]);
              }
              paginated.fetch();
              return Center(child: loading ?? const CircularProgressIndicator());
            },
          ),
        );
      },
    );
  }
}

class PaginatedListStatic<T> extends StatelessWidget {
  const PaginatedListStatic({
    super.key,
    required this.paginated,
    required this.itemBuilder,
    this.axis = Axis.vertical,
    this.physics = const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
    this.loading,
    this.itemExtent,
    this.padding,
    this.empty,
    this.scrollController,
    this.shrinkWrap = true,
    this.skip = 0,
  });

  final Paginated<T> paginated;

  final Widget? loading;
  final Widget? empty;
  final Axis axis;
  final ScrollPhysics physics;
  final Widget Function(BuildContext context, int index, T item) itemBuilder;
  final EdgeInsets? padding;
  final double? itemExtent;
  final bool shrinkWrap;
  final ScrollController? scrollController;
  final int skip;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (paginated.isLoading.value || !paginated.initialized) {
          return Center(child: loading ?? const CircularProgressIndicator());
        }
        if (paginated.items.isEmpty) {
          return empty ?? Text("empty".tr);
        }
        return ListView.builder(
          controller: scrollController,
          itemExtent: itemExtent,
          scrollDirection: axis,
          physics: physics,
          itemCount: paginated.listLength - skip,
          padding: padding,
          shrinkWrap: shrinkWrap,
          itemBuilder: (ctx, idx) {
            if ((idx + skip) < paginated.items.length) {
              return itemBuilder(ctx, idx, paginated.items[idx + skip]);
            }
            paginated.fetch();
            return Center(child: loading ?? const CircularProgressIndicator());
          },
        );
      },
    );
  }
}
