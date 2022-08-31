import 'package:flutter/material.dart';
import 'package:hostel_keys_management/providers/config_provider.dart';
import 'package:hostel_keys_management/providers/user_provider.dart';
import 'package:hostel_keys_management/screens/ShowQR.dart';
import 'package:hostel_keys_management/screens/login.dart';
import 'package:hostel_keys_management/screens/room.dart';
import 'package:hostel_keys_management/screens/rooms.dart';
import 'package:hostel_keys_management/screens/splash_screen.dart';
import 'package:hostel_keys_management/screens/user.dart';
import 'package:hostel_keys_management/screens/verify_otp.dart';
import 'package:hostel_keys_management/screens/scanQR.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './screens/home.dart';
import './screens/test_home.dart';
import './screens/room.dart';
import './models/config.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => ConfigProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ConfigProvider>().setConfig(
          Config(
              apiHostname: 'http://10.102.42.37:8081',
              logoUrl:
                  'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png'),
        );

    return MaterialApp(
        title: 'Rent a Key',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/testScreen': (context) => const TestHomePage(),
          '/login': (context) => LoginPage(),
          '/verify_otp': (context) => const VerifyOTP(),
          '/scan_qr_code': (context) => ScanQrPage(),
          '/show_qr_code': (context) => const ShowQRPage(),
          '/room': (context) => RoomScreen(),
          '/rooms': (context) => RoomsScreen(),
          '/user': (context) => const UserScreen(),
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
