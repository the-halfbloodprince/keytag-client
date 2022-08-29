import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';


class QRCode extends StatelessWidget {
  final String data;

  QRCode(this.data);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          QrImage(
            data: data,
            version: QrVersions.auto,
            size: 200.0,
          ),
        ],
      ),
    );
  }
}
