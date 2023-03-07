import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:personal_website/ui/screens/my_website/body.dart';
import 'package:personal_website/utils/responsive.dart';

import '../../../utils/constant.dart';
import 'navbar.dart';

class PersonalWebsite extends StatelessWidget {
  const PersonalWebsite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Responsive(
              mobile: Container(color: Colors.red),
              tablet:const NavBarDesktop(),
              desktop: const NavBarDesktop()),
        ),
        body: const WebsiteBody());
  }
}
