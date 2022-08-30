import 'package:flutter/widgets.dart';
import '../models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  User? _currentUser;
  User? get currentUser => _currentUser;
  void setUser(User user) async {
    _currentUser = user;

    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setString('name', user.name);
    await storage.setString('email', user.email);
    await storage.setString('mobile', user.mobile);
    await storage.setString('room', user.room);
    await storage.setString('roll', user.roll);
    await storage.setString('image', user.image);
    await storage.setString('token', user.token);
    await storage.setBool('loggedIn', true);

    notifyListeners();
  }

  void removeUser() async {
    _currentUser = null;
    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.remove('name');
    await storage.remove('email');
    await storage.remove('mobile');
    await storage.remove('room');
    await storage.remove('roll');
    await storage.remove('image');
    await storage.remove('token');
    storage.setBool('loggedIn', false);
    
    notifyListeners();
  }
}
