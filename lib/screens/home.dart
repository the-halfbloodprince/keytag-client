import 'package:flutter/material.dart';

import '../layouts/general.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<String> rooms = ['Music Room', 'Library', 'Gym', 'D211'];

  @override
  Widget build(BuildContext context) {
    Widget mainWidget = const Text('hi');
    return Layout(child: mainWidget);
  }
}
