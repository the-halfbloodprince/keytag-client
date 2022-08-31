import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hostel_keys_management/config/variables.dart';
import 'package:hostel_keys_management/models/room.dart';
import 'package:hostel_keys_management/utils.dart';
import 'package:hostel_keys_management/widgets/room_card.dart';
import 'package:http/http.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';
import 'package:provider/provider.dart';

class RoomKey {
  String name, id;
  RoomKey(this.id, this.name);
}

class RoomsScreen extends StatefulWidget {
  static String imgSrc =
      'https://images.unsplash.com/photo-1524230572899-a752b3835840?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436&q=80';

  RoomsScreen({Key? key}) : super(key: key);

  @override
  State<RoomsScreen> createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  // TODO: get all the keys from the API

  // List<RoomKey> rooms = [
  //   RoomKey('1', 'Music Room'),
  //   RoomKey('2', 'Library'),
  //   RoomKey('3', 'Gym'),
  //   RoomKey('4', 'Mess'),
  //   RoomKey('5', 'Strong Room'),
  //   RoomKey('6', 'Common Room'),
  // ];

  List<RoomKey> rooms = [];

  void getKeys(BuildContext ctx) async {
    Response res = await get(Uri.parse(generateUrl(context, ['api', 'keys'])),
        headers: getHeaders(ctx));
    var resBody = jsonDecode(utf8.decode(res.bodyBytes)) as Map;
    List<RoomKey> r = [];
    for (var room in resBody['data']) {
      r.add(RoomKey(room['_id'], room['name']));
    }
    setState(() {
      // print(rooms);
      rooms = r;
    });
  }

  @override
  Widget build(BuildContext context) {
    User? me = context.watch<UserProvider>().currentUser;

    if (me == null) {
      Navigator.pushNamed(context, 'login');
    }

    // print(me!.name);

    // get the keys
    getKeys(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        // color: Colors.amber,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(RoomsScreen.imgSrc),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.08,
        ),
        child: Container(
          decoration: const BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Container(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              //   height: MediaQuery.of(context).size.height * 0.86 * 0.15,
              //   child: Row(
              //     children: [Image.network(logoUrl)],
              //   ),
              //   // color: Colors.red,
              // ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Rooms',
                style: TextStyle(fontSize: 40),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: rooms
                        .map((room) => RoomCard(room.id, room.name, true))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
