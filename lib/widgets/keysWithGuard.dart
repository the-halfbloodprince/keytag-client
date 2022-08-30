import 'package:flutter/material.dart';
import 'package:hostel_keys_management/models/room.dart';

class WithGuard extends StatelessWidget {
  WithGuard({required this.room});
  final Room room;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Container(
          width: double.infinity,
          height: 200,
          // color: Colors.amber,
          child: Center(
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                // color: Colors.amber,
                borderRadius: BorderRadius.circular(200),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://firebasestorage.googleapis.com/v0/b/ourmandav.appspot.com/o/XXG.jpg?alt=media&token=10ac3fe5-944e-4021-ad52-bdb6cbe80bbe'),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Text(
            '${room.name} Keys are with the guard',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/scan_qr_code');
            },
            icon: const Icon(Icons.key),
            label: const Text('Claim Keys'),
            style: ElevatedButton.styleFrom(
              // padding: EdgeInsets.all(20),
              minimumSize: const Size.fromHeight(50),
              primary: Colors.lightBlueAccent,
              textStyle: const TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
