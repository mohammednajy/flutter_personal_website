import 'package:flutter/material.dart';
import 'package:personal_website/logic/scroll_provider.dart';
import 'package:personal_website/ui/screens/contact/contact.dart';
import 'package:personal_website/ui/screens/home/home.dart';
import 'package:personal_website/ui/screens/services/services.dart';
import 'package:personal_website/ui/screens/works/works.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class WebsiteBody extends StatelessWidget {
  const WebsiteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemPositionsListener:  Provider.of<ScrollProvider>(context).itemPositionsListener,
      padding: EdgeInsets.zero,
      itemCount: BodySections.sections.length,
      itemBuilder: (context, index) => BodySections.sections[index],
      itemScrollController:
          Provider.of<ScrollProvider>(context).itemScrollController,
    );
  }
}

class BodySections {
  static List<Widget> sections = const [
    Home(),
    Services(),
    Works(),
    Contact(),
  ];
}
