import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Route {
  String name, path;
  Route(this.name, this.path);
}

class TestHomePage extends StatelessWidget {
  const TestHomePage({Key? key}) : super(key: key);

  static List<Route> routes = [
    Route('Generate Random Code', '/generate_random_qr'),
    Route('Scan QR Code', '/scan_qr_code'),
    Route('Login', '/login'),
    Route('Room', '/room'),
    Route('Rooms', '/rooms'),
    Route('User', '/user'),
    Route('Web View Test', '/web_view'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.blue.shade700,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: routes
            .map((route) => ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, route.path);
                },
                child: Text(route.name)))
            .toList(),
      ),
    );
  }
}
