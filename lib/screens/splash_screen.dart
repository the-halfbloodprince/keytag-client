import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hostel_keys_management/providers/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void load() async {
      SharedPreferences storage = await SharedPreferences.getInstance();
      print(storage.getString('isLoggedIn'));
      if (storage.getString('isLoggedIn') == 'true' ||
          (context.read<UserProvider>().currentUser != null)) {
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
