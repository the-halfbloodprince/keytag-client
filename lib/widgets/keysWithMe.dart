import 'package:flutter/material.dart';
import 'package:hostel_keys_management/providers/user_provider.dart';
import 'package:hostel_keys_management/screens/ShowQR.dart';
import 'package:hostel_keys_management/screens/scanQR.dart';
import 'package:hostel_keys_management/utils.dart';
import '../models/user.dart';
import '../models/room.dart';
import 'package:provider/provider.dart';

class WithMe extends StatelessWidget {
  const WithMe({
    Key? key,
    required this.room,
    required this.keysWith,
  }) : super(key: key);

  final Room room;
  final User keysWith;

  @override
  Widget build(BuildContext context) {
    User? me = context.watch<UserProvider>().currentUser;

    if (me == null) {
      Navigator.pushNamed(context, '/login');
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      // color: Colors.purple,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    '${room.name} keys with',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 100,
                    // color: Colors.amber,
                    child: Center(
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                              image: NetworkImage(keysWith.image)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    keysWith.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.house, color: Colors.black45),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(keysWith.room,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.phone, color: Colors.black45),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(keysWith.mobile,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.email, color: Colors.black45),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(keysWith.email,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, '/show_qr_code',
                              arguments: ShowQRPageArgs(
                                  generateUrl(
                                    context,
                                    [
                                      'api',
                                      'transfer',
                                      room.id,
                                      me!.id,
                                    ],
                                  ),
                                  'Scan this QR code to get the ${room.name} keys'));
                        },
                        icon: const Icon(Icons.key),
                        label: const Text('Transfer Keys'),
                        style: ElevatedButton.styleFrom(
                          // padding: EdgeInsets.all(20),
                          minimumSize: const Size.fromHeight(50),
                          primary: Colors.lightBlueAccent,
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            '/scan_qr_code',
                            arguments: ScanQRPageArgs(true),
                          );
                        },
                        icon: const Icon(Icons.key),
                        label: const Text('Return keys'),
                        style: OutlinedButton.styleFrom(
                          // padding: EdgeInsets.all(20),
                          minimumSize: const Size.fromHeight(50),
                          primary: Colors.lightBlueAccent,
                          textStyle: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
