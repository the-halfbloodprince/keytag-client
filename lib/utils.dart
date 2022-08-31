import 'package:flutter/cupertino.dart';
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