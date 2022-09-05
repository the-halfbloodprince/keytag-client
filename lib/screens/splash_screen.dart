import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hostel_keys_management/providers/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    load();
  }

  void load() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    // print(storage.getString('loggedIn'));
    if (storage.getBool('loggedIn') == true) {
      Navigator.pushNamed(context, '/rooms');
    } else {
      Navigator.pushNamed(context, '/login');
    }

    Map<String, String> data = {
      'id': storage.getString('id')!,
      'name': storage.getString('name')!,
      
      'email': storage.getString('email')!,
      'roll': storage.getString('roll')!,
      'room': storage.getString('room')!,
      'mobile': storage.getString('mobile')!,
      'image': storage.getString('image')!,
      'token': storage.getString('token')!,
    };

    context.read<UserProvider>().setUser(User(
          id: data['id']!,
          name: data['name']!,
          email: data['email']!,
          roll: data['roll']!,
          room: data['room']!,
          mobile: data['mobile']!,
          image: data['image']!,
          token: data['token']!,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Keyscan'),
    );
  }
}
