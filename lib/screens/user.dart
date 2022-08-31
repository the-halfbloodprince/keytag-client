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

    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Text(me!.name),
          Text(me.email),
          Text(me.roll),
          Text(me.room),
          Text(me.mobile),
        ],
      ),
    ));
  }
}
