import 'package:flutter/material.dart';
import 'package:personal_website/utils/responsive.dart';

import 'home_desktop.dart';
import 'home_tablet.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: Container(
          height: 800,
          width: 400,
          color: Colors.pink,
          alignment: Alignment.center,
          child: const Text('Home'),
        ),
        tablet: const HomeTablet(),
        desktop: const HomeDesktop());
  }
}
