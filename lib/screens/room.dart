import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../layouts/general.dart';
import '../models/users.dart';
import '../config/variables.dart';
import '../widgets/keysWithGuard.dart';
import '../widgets/keysWithUser.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Room extends StatelessWidget {
  String keyID;
  Room(this.keyID);

  static String room_name = 'Music Room';

  static String imgSrc =
      'https://images.unsplash.com/photo-1550895030-823330fc2551?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80';

  

  User? keysWith = User(
    name: 'Manish Kumar Das',
    mobile: '6969696969',
    email: '69@brazzers.com',
    roll: '19FF69069',
    room: 'F-690',
    image:
        'https://firebasestorage.googleapis.com/v0/b/ourmandav.appspot.com/o/XXL.jpg?alt=media&token=9d8dfe97-4b3d-4c39-af87-9725ddd3710e',
  );

  // User? keysWith = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        // color: Colors.amber,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imgSrc),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.1,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: MediaQuery.of(context).size.height * 0.86 * 0.15,
                child: Row(
                  children: [Image.network(logoUrl)],
                ),
                // color: Colors.red,
              ),
              Expanded(
                child: keysWith == null
                    ? const WithGuard()
                    : WithUserWidget(keysWith: keysWith!),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.86 * 0.05,
                // color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
