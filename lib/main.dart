import 'package:flutter/material.dart';
import 'package:hostel_keys_management/screens/ShowQR.dart';
import 'package:hostel_keys_management/screens/login.dart';
import 'package:hostel_keys_management/screens/room.dart';
import 'package:hostel_keys_management/screens/verify_otp.dart';
import 'package:hostel_keys_management/screens/scanQR.dart';
import './screens/home.dart';
import './screens/test_home.dart';
import './screens/room.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Rent a Key',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/testScreen',
        routes: {
          '/testScreen': (context) => const TestHomePage(),
          '/login': (context) => LoginPage(),
          '/verify_otp': (context) => const VerifyOTP(),
          '/scan_qr_code': (context) => ScanQrPage(),
          '/show_qr_code': (context) => const ShowQRPage(),
          '/room': (context) => Room('1'),
          // '/generate_random_qr': (context) => TestHomePage(),
          // '/web_view': (context) =>
          //     WebViewContainer('https://github.com/the-halfbloodprince'),
        }
        // home: Scaffold(
        //   // body: HomePage(),
        //   body: TestHomePage(),
        // ),
        );
  }
}
