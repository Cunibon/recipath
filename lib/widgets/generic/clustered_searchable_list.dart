import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:recipath/l10n/app_localizations.dart';
import 'package:recipath/widgets/generic/empty_state.dart';
import 'package:recipath/widgets/generic/highlight_search/highlight_scope.dart';

class ClusteredSearchableList<T, R> extends StatefulWidget {
  const ClusteredSearchableList({
    this.initialSearch,
    this.searchController,
    required this.name,
    required this.clusters,
    required this.itemToSearchable,
    required this.itemToWidget,
    required this.clusterToWidget,
    this.sortItems,
    this.sortClusters,
    this.trailing,
    this.emptyState,
    this.listViewPadding = const EdgeInsets.only(bottom: 78),
    super.key,
  }) : assert(initialSearch == null || searchController == null);

  final String? initialSearch;
  final TextEditingController? searchController;

  final String name;
  final List<ItemCluster<T, R>> clusters;

  final String Function(T item) itemToSearchable;
  final Widget Function(T item) itemToWidget;
  final Widget Function(R clusterId) clusterToWidget;

  final int Function(T a, T b)? sortItems;
  final int Function(R a, R b)? sortClusters;

  final Widget? trailing;
  final Widget? emptyState;
  final EdgeInsets listViewPadding;

  @override
  State<ClusteredSearchableList<T, R>> createState() =>
      _ClusteredSearchableListState();
}

class _ClusteredSearchableListState<T, R>
    extends State<ClusteredSearchableList<T, R>> {
  late Map<R, List<({T item, String search})>> searchable;
  late String search = "";
  TextEditingController? controller;

  @override
  void initState() {
    super.initState();

    if (widget.initialSearch != null) {
      search = widget.initialSearch!;
      controller = TextEditingController(text: widget.initialSearch);
    } else if (widget.searchController != null) {
      controller = widget.searchController!;
    }

    searchable = createSearchable(widget.clusters);
  }

  @override
  void dispose() {
    if (widget.searchController == null) {
      controller?.dispose();
    }
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ClusteredSearchableList<T, R> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listEquals(widget.clusters, oldWidget.clusters)) {
      searchable = createSearchable(widget.clusters);
    }
  }

  Map<R, List<({T item, String search})>> createSearchable(
    List<ItemCluster<T, R>> clusters,
  ) {
    final List<ItemCluster<T, R>> clusterCopy;

    if (widget.sortClusters != null) {
      clusterCopy = List<ItemCluster<T, R>>.from(clusters);
      clusterCopy.sort((a, b) => widget.sortClusters!(a.id, b.id));
    } else {
      clusterCopy = clusters;
    }

    return {
      for (final cluster in clusterCopy)
        cluster.id:
            cluster.items
                .map<({T item, String search})>(
                  (e) => (item: e, search: widget.itemToSearchable(e)),
                )
                .toList()
              ..sort((a, b) => widget.sortItems?.call(a.item, b.item) ?? 0),
    };
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    late Map<R, List<T>> clusters;

    if (search == "") {
      clusters = {
        for (final entry in searchable.entries)
          entry.key: entry.value.map((e) => e.item).toList(),
      };
    } else {
      clusters = {
        for (final entry in searchable.entries)
          entry.key: entry.value
              .where(
                (e) => e.search.toLowerCase().contains(search.toLowerCase()),
              )
              .map((e) => e.item)
              .toList(),
      };
    }

    clusters.removeWhere((key, value) => value.isEmpty);

    late Widget child;

    if (clusters.isEmpty) {
      if (widget.clusters.isEmpty) {
        child = widget.emptyState ?? SizedBox.shrink();
      } else {
        child = EmptyState(hint: localization.changeSearchForResults);
      }
    } else {
      child = CustomScrollView(
        slivers: [
          for (var cluster in clusters.entries)
            SliverMainAxisGroup(
              slivers: [
                PinnedHeaderSliver(child: widget.clusterToWidget(cluster.key)),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>
                        widget.itemToWidget(cluster.value[index]),
                    childCount: cluster.value.length,
                  ),
                ),
              ],
            ),
        ],
      );
    }

    return HighlightScope(
      highlightTerm: search,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(
                      context,
                    )!.searchFor(widget.name),
                  ),
                  onChanged: (value) => setState(() => search = value),
                ),
              ),
              ?widget.trailing,
            ],
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class ItemCluster<T, R> {
  ItemCluster({required this.id, required this.items});

  final R id;
  final List<T> items;
}
