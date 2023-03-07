import 'package:flutter/material.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({
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
            child: Image.asset(
              'assets/images/background.png',
              opacity: const AlwaysStoppedAnimation(0.3),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: size.width <= 1200 ? 50 : 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'HELLO, MY NAME IS',
                    style: TextStyle(
                        fontFamily: 'Barlow',
                        color: Color(0xFF758398),
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                  Container(
                    height: 2,
                    width: 50,
                    color: const Color(0xFF758398),
                    margin: const EdgeInsets.only(top: 10, bottom: 55
                        // size.height * 0.07,
                        ),
                  ),
                  Text(
                    'Mohammed Naji',
                    style: TextStyle(
                      fontSize: size.width <= 1200 ? 40 : 60,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PlayfairDisplay',
                    ),
                  ),
                  const Text(
                    'Flutter Developer',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PlayfairDisplay',
                        color: Color(0xFF758398)),
                  ),
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                  const HomeInfoWidget(
                      label: 'dev.moh.naji@gmail.com', icon: Icons.email_sharp),
                  const SizedBox(height: 10
                      //  size.height * 0.01,
                      ),
                  const HomeInfoWidget(
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

class HomeInfoWidget extends StatelessWidget {
  const HomeInfoWidget(
      {Key? key, required this.icon, required this.label, this.fontSize = 20})
      : super(key: key);
  final IconData icon;
  final String label;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.blue.shade500,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontFamily: 'Barlow',
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
