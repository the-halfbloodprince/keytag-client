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
import './screens/test_home.dart';
import './screens/room.dart';
import './models/config.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
      ChangeNotifierProvider(create: (_) => ConfigProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ConfigProvider>().setConfig(
          Config(
              // apiHostname: 'http://10.102.42.37:8081',
              // apiHostname: 'http://9e77-203-110-242-31.ngrok.io',
              apiHostname: 'http://13.127.74.133:8081',
              seed: 'JwzeoyLfslWTfM_OMAEt5GCXch9IKxkJ',
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
          // '/': (context) => LoginPage(),
          // '/': (context) => const UserScreen(),
          // '/': (context) => RoomsScreen(),
          '/testScreen': (context) => const TestHomePage(),
          '/login': (context) => LoginPage(),
          '/verify_otp': (context) => const VerifyOTP(),
          '/scan_qr_code': (context) => ScanQrPage(),
          '/show_qr_code': (context) => const ShowQRPage(),
          '/room': (context) => RoomScreen(),
          '/rooms': (context) => RoomsScreen(),
          '/user': (context) => const UserScreen(),
        }
        );
  }
}
