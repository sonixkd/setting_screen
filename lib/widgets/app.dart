import 'package:app_setting_screen/widgets/user_profile.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProfile(),
    );
  }
}
