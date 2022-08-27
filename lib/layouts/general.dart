import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Layout extends StatelessWidget {
  Widget child;
  Layout({required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.15,
          color: Colors.amber,
        ),
        Expanded(
          child: Container(
            child: child,
          ),
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.1,
          color: Colors.amber,
        )
      ],
    );
  }
}
