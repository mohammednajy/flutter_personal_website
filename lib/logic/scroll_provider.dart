import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ScrollProvider extends ChangeNotifier {
  bool isScroll = false;
  final ItemScrollController itemScrollController = ItemScrollController();
  final scrollDuration = const Duration(seconds: 1);
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  void jumpTo(int index) => itemScrollController.scrollTo(
      index: index,
      duration: scrollDuration,
      curve: Curves.easeInOutCubic,
      alignment: 0);
  void scrollListener() {
    itemPositionsListener.itemPositions.addListener(() {
      isScroll = itemPositionsListener.itemPositions.value
              .toList()[0]
              .itemLeadingEdge !=
          0;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    itemPositionsListener.itemPositions.removeListener(() {});
    super.dispose();
  }
}
