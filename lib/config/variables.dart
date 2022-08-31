import 'package:flutter/cupertino.dart';
import 'package:hostel_keys_management/providers/user_provider.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';

Map<String, String> getHeaders(BuildContext ctx) {
  User? me = ctx.read<UserProvider>().currentUser;
  Map<String, String> headers = {'version': '0.1.1'};
  if (me != null) {
    headers['x-auth-token'] = me.token;
  }
  return headers;
}
