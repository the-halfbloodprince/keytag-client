import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hostel_keys_management/providers/user_provider.dart';
import 'package:hostel_keys_management/utils.dart';
import 'package:hostel_keys_management/widgets/keysWithMe.dart';
import 'package:hostel_keys_management/widgets/loading.dart';
import 'package:http/http.dart';
import '../models/user.dart';
import '../widgets/keysWithGuard.dart';
import '../widgets/keysWithUser.dart';
import 'package:provider/provider.dart';
import '../models/room.dart';
import '../config/variables.dart';
import '../providers/config_provider.dart';

class RoomScreenArgs {
  String id, name;
  RoomScreenArgs(this.id, this.name);
}

class RoomScreen extends StatefulWidget {
  static String imgSrc =
      'https://images.unsplash.com/photo-1550895030-823330fc2551?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80';

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  bool loading = true;

  User? keysWith;

  // User? keysWith = User(
  //   name: 'Manish Kumar Das',
  //   mobile: '6969696969',
  //   email: '69@brazzers.com',
  //   roll: '19GG20017',
  //   room: 'F-690',
  //   token: 'wcdxxcbwijkcbcb',
  //   image:
  //       'https://firebasestorage.googleapis.com/v0/b/ourmandav.appspot.com/o/XXL.jpg?alt=media&token=9d8dfe97-4b3d-4c39-af87-9725ddd3710e',
  // );

  void getKeysWith(BuildContext ctx, RoomScreenArgs args) async {
    Response res = await get(
        Uri.parse(generateUrl(ctx, ['api', 'key', args.id])),
        headers: getHeaders(ctx));
    var resBody = jsonDecode(utf8.decode(res.bodyBytes)) as Map;
    print(resBody);
    // Response resUser = await get(
    //     Uri.parse(generateUrl(ctx, ['api', 'user', resBody])),
    //     headers: getHeaders(ctx));
    // var resUserBody = jsonDecode(utf8.decode(res.bodyBytes)) as Map;

    User? user;

    if (resBody['data']['user'] == null) {
      user = null;
    } else {
      user = User(
        id: resBody['data']['user']['_id'],
        name: resBody['data']['user']['name'],
        email: resBody['data']['user']['email'],
        roll: resBody['data']['user']['roll'],
        room: resBody['data']['user']['room'],
        image: resBody['data']['user']['image'],
        mobile: resBody['data']['user']['mobile'],
        token: 'null',
      );
    }

    setState(() {
      keysWith = user;
      loading = false;
    });
  }

  // User? keysWith = null;
  @override
  Widget build(BuildContext context) {
    User? me = context.watch<UserProvider>().currentUser;

    if (me == null) {
      Navigator.pushNamed(context, '/login');
    }

    RoomScreenArgs args =
        ModalRoute.of(context)!.settings.arguments as RoomScreenArgs;

    getKeysWith(context, args);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(RoomScreen.imgSrc),
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
          child: loading
              ? const Loading()
              : RoomData(keysWith: keysWith, args: args, me: me),
        ),
      ),
    );
  }
}

class RoomData extends StatelessWidget {
  const RoomData({
    Key? key,
    required this.keysWith,
    required this.args,
    required this.me,
  }) : super(key: key);

  final User? keysWith;
  final RoomScreenArgs args;
  final User? me;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          height: MediaQuery.of(context).size.height * 0.86 * 0.15,
          child: Row(
            children: [
              Image.network(context.read<ConfigProvider>().appConfig.logoUrl)
            ],
          ),
          // color: Colors.red,
        ),
        Expanded(
          child: keysWith == null
              ? WithGuard(
                  room: Room(args.id, args.name),
                )
              : (keysWith!.id == me!.id
                  ? WithMe(room: Room(args.id, args.name), keysWith: keysWith!)
                  : WithUserWidget(
                      room: Room(args.id, args.name), keysWith: keysWith!)),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.86 * 0.05,
          // color: Colors.red,
        ),
      ],
    );
  }
}
