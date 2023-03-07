import 'package:flutter/material.dart';
import 'package:personal_website/logic/scroll_provider.dart';
import 'package:provider/provider.dart';

import 'ui/screens/my_website/personal_website.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ScrollProvider(),
          ),
        ],
        child: const PersonalWebsite(),
      ),
    );
  }
}
