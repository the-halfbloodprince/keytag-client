import 'package:flutter/cupertino.dart';
import 'package:hostel_keys_management/providers/user_provider.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';

Map<String, String> getHeaders(BuildContext ctx) {
  User? me = ctx.read<UserProvider>().currentUser;
  if (me == null) {
    return {};
  }
  return {'x-auth-token': me.token};
}
