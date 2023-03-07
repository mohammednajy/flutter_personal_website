import 'package:flutter/material.dart';

import 'home_desktop.dart';

class HomeTablet extends StatelessWidget {
  const HomeTablet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: SizedBox(
            width: size.width / 2,
            height: size.height,
            child: Image.asset(
              'assets/images/background.png',
              opacity: const AlwaysStoppedAnimation(0.3),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100, right: 10, left: 10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'HELLO, MY NAME IS',
                    style: TextStyle(
                        fontFamily: 'Barlow',
                        color: Color(0xFF758398),
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                  Container(
                    height: 2,
                    width: 40,
                    color: const Color(0xFF758398),
                    margin: const EdgeInsets.only(top: 10, bottom: 80
                        // size.height * 0.07,
                        ),
                  ),
                  const Text(
                    'Mohammed Naji',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PlayfairDisplay',
                    ),
                  ),
                  const Text(
                    'Flutter Developer',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PlayfairDisplay',
                        color: Color(0xFF758398)),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  const HomeInfoWidget(
                      fontSize: 16,
                      label: 'dev.moh.naji@gmail.com',
                      icon: Icons.email_sharp),
                  const SizedBox(height: 5
                      //  size.height * 0.01,
                      ),
                  const HomeInfoWidget(
                    fontSize: 16,
                    label: '+972-592663680',
                    icon: Icons.call,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: CircleAvatar(
                  radius: size.width * 0.22,
                  backgroundImage:
                      const AssetImage('assets/images/background_mock.png'),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
