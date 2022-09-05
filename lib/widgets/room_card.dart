import 'package:flutter/material.dart';
import '../screens/room.dart';

class RoomCard extends StatelessWidget {
  final String title, id;
  final bool locked;

  RoomCard(this.id, this.title, this.locked);

  @override
  Widget build(BuildContext context) {
    void handleTap() async {
      // print('go to room $title');
      Navigator.pushNamed(context, '/room',
          arguments: RoomScreenArgs(id, title));
    }

    return GestureDetector(
      onTap: handleTap,
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.white,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: const Alignment(0.8, 1),
            colors: <Color>[
              Colors.blue.shade400,
              Colors.blue.shade800,
            ],
          ),
          border: Border.all(
            color: Colors.blue,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
