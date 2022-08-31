import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:hostel_keys_management/providers/config_provider.dart';
import 'package:provider/provider.dart';

String generateUrl(BuildContext ctx, List<String> params) {
  String apiHostname = ctx.read<ConfigProvider>().appConfig.apiHostname;
  String url = apiHostname;

  for (String param in params) {
    url += '/$param';
  }

  return url;
}

void showSnackBar(BuildContext context, String title, String message, ContentType contentType) {
  var snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: title,
      message: message,
      contentType: contentType,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

String generateNonce(BuildContext context) {
  var seed = context.read<ConfigProvider>().appConfig.seed;
  var time = (DateTime.now().millisecondsSinceEpoch / 30000).floor().toString();
  var seedInBytes = utf8.encode(seed + time);
  var value = sha256.convert(seedInBytes);
  return value.toString();
}
