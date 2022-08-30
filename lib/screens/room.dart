import 'package:flutter/material.dart';
import 'package:hostel_keys_management/providers/user_provider.dart';
import 'package:hostel_keys_management/widgets/keysWithMe.dart';
import '../models/user.dart';
import '../widgets/keysWithGuard.dart';
import '../widgets/keysWithUser.dart';
import 'package:provider/provider.dart';
import '../models/room.dart';

class RoomScreenArgs {
  String id, name;
  RoomScreenArgs(this.id, this.name);
}

class RoomScreen extends StatelessWidget {
  static String logoUrl =
      'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png';

  static String roomName = 'Music Room';

  static String imgSrc =
      'https://images.unsplash.com/photo-1550895030-823330fc2551?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80';

  User? keysWith = User(
    name: 'Manish Kumar Das',
    mobile: '6969696969',
    email: '69@brazzers.com',
    roll: '19GG20017',
    room: 'F-690',
    token: 'wcdxxcbwijkcbcb',
    image:
        'https://firebasestorage.googleapis.com/v0/b/ourmandav.appspot.com/o/XXL.jpg?alt=media&token=9d8dfe97-4b3d-4c39-af87-9725ddd3710e',
  );

  // User? keysWith = null;

  @override
  Widget build(BuildContext context) {
    User? me = context.watch<UserProvider>().currentUser;

    if (me == null) {
      Navigator.pushNamed(context, '/login');
    }

    RoomScreenArgs args =
        ModalRoute.of(context)!.settings.arguments as RoomScreenArgs;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                height: MediaQuery.of(context).size.height * 0.86 * 0.15,
                child: Row(
                  children: [Image.network(logoUrl)],
                ),
                // color: Colors.red,
              ),
              Expanded(
                child: keysWith == null
                    ? WithGuard(
                        room: Room(args.id, args.name),
                      )
                    : (keysWith!.roll == me!.roll
                        ? WithMe(
                            room: Room(args.id, args.name), keysWith: keysWith!)
                        : WithUserWidget(
                            room: Room(args.id, args.name),
                            keysWith: keysWith!)),
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
