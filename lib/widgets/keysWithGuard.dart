import 'package:flutter/material.dart';

class WithGuard extends StatelessWidget {
  const WithGuard({Key? key}) : super(key: key);

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
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Text(
            'Keys are with the guard',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: ElevatedButton.icon(
            onPressed: () {
              print('heyyy');
              Navigator.pushNamed(context, '/scan_qr_code');
            },
            icon: Icon(Icons.key),
            label: Text('Claim Keys'),
            style: ElevatedButton.styleFrom(
              // padding: EdgeInsets.all(20),
              minimumSize: Size.fromHeight(50),
              primary: Colors.lightBlueAccent,
              textStyle: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}