import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void load() async {
      SharedPreferences storage = await SharedPreferences.getInstance();
      if (storage.getString('isLoggedIn') == 'true') {
        Navigator.pushNamed(context, '/rooms');
      }
      Navigator.pushNamed(context, '/login');
    }

    load();

    return const Scaffold(
      body: Text('Keyscan'),
    );
  }
}
