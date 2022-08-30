import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../screens/room.dart';

class RoomCard extends StatelessWidget {
  String title, id;
  bool locked;

  RoomCard(this.id, this.title, this.locked);

  @override
  Widget build(BuildContext context) {
    void handleTap() async {
      print('go to room ' + title);
      Navigator.pushNamed(context, '/room',
          arguments: RoomScreenArgs(id, title));
    }

    return GestureDetector(
      onTap: handleTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
