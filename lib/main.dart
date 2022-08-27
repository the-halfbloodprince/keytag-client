import 'package:flutter/material.dart';
import 'package:hostel_keys_management/screens/login.dart';
import 'package:hostel_keys_management/screens/verify_otp.dart';
import 'package:hostel_keys_management/screens/tests/scanQR.dart';
import './screens/home.dart';
import './screens/test_home.dart';

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
          '/testScreen': (context) => TestHomePage(),
          '/login': (context) => LoginPage(),
          '/verify_otp': (context) => VerifyOTP(),
          '/scan_qr_code': (context) => ScanQrPage(),
          // '/room': (context) => TestHomePage(),
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
