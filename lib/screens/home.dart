import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hostel_keys_management/widgets/qr.dart';

import '../layouts/general.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<String> rooms = ['Music Room', 'Library', 'Gym', 'D211'];

  @override
  Widget build(BuildContext context) {
    Widget mainWidget = Text('hi');
    return Layout(child: mainWidget);
  }
}
