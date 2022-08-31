import 'package:flutter/material.dart';
import 'package:hostel_keys_management/models/user.dart';
import 'package:provider/provider.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hostel_keys_management/providers/user_provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? me = context.read<UserProvider>().currentUser;
    void logOut() {
      context.read<UserProvider>().removeUser();
      Navigator.pushNamed(context, '/');
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              me!.name,
              style: const TextStyle(fontSize: 40),
            ),
            Text(
              me.email,
              style: const TextStyle(fontSize: 40),
            ),
            Text(
              me.roll,
              style: const TextStyle(fontSize: 40),
            ),
            Text(
              me.room,
              style: const TextStyle(fontSize: 40),
            ),
            Text(
              me.mobile,
              style: const TextStyle(fontSize: 40),
            ),
            ElevatedButton(
              onPressed: logOut,
              child: const Text(
                'Logout',
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
