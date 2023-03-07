import 'package:flutter/material.dart';
import 'package:personal_website/utils/responsive.dart';
import 'package:provider/provider.dart';
import '../../../logic/scroll_provider.dart';
import '../../../utils/constant.dart';

class NavBarDesktop extends StatefulWidget {
  const NavBarDesktop({super.key});

  @override
  State<NavBarDesktop> createState() => _NavBarDesktopState();
}

class _NavBarDesktopState extends State<NavBarDesktop> {
  bool opened = false;

  @override
  Widget build(BuildContext context) {
    context.watch<ScrollProvider>().scrollListener();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      color: Provider.of<ScrollProvider>(context, listen: true).isScroll
          ? Colors.white
          : Colors.transparent,
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () =>
                  Provider.of<ScrollProvider>(context, listen: false).jumpTo(0),
              hoverColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 55,
                ),
              ),
            ),
            // TODO: use dropdown button insted of using popup
            !Responsive.isDesktop(context)
                ? PopupMenuButton(
                    // key: GlobalKey<PopupMenuButtonState>().currentState.,
                    itemBuilder: (context) => navItems
                        .asMap()
                        .entries
                        .map(
                          (e) => PopupMenuItem(
                            value: e.key,
                            height: 70,
                            child: Text(e.value),
                          ),
                        )
                        .toList(),
                    onSelected: (int value) {
                      Provider.of<ScrollProvider>(context, listen: false)
                          .jumpTo(value);
                    },

                    offset: const Offset(0, 35),
                    constraints: const BoxConstraints.expand(
                      height: 300,
                      width: 200,
                    ),
                    child: const Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 40,
                    ),
                  )
                : SizedBox(
                    width: 560,
                    height: 55,
                    // height * 0.07,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: navItems
                          .asMap()
                          .entries
                          .map((e) => NavItem(
                                label: e.value,
                                index: e.key,
                                hoverSize: hoverSizes[e.key],
                              ))
                          .toList(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatefulWidget {
  const NavItem(
      {required this.label,
      required this.index,
      super.key,
      required this.hoverSize});
  final String label;
  final int index;
  final double hoverSize;

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: false,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      onTap: () {
        Provider.of<ScrollProvider>(context, listen: false)
            .jumpTo(widget.index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isHover
              ? Container(
                  alignment: Alignment.center,
                  color: Colors.blue.shade300,
                  height: 2,
                  width: widget.hoverSize,
                )
              : const SizedBox(),
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'Barlow',
              color: isHover ? Colors.blue.shade300 : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
