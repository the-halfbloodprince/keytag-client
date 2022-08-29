import 'package:flutter/material.dart';
import 'package:hostel_keys_management/widgets/qr.dart';

class ShowQRPageArgs {
  String url;
  ShowQRPageArgs(this.url);
}

class ShowQRPage extends StatelessWidget {
  const ShowQRPage();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ShowQRPageArgs;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          QRCode(args.url),
        ],
      ),
    );
  }
}
