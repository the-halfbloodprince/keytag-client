import 'package:flutter/widgets.dart';
import 'package:hostel_keys_management/models/config.dart';

class ConfigProvider with ChangeNotifier {
  Config _appConfig = Config(
    apiHostname: 'http://localhost:8081',
    logoUrl: 'http://google.com',
  );
  Config get appConfig => _appConfig;
  void setConfig(Config config) {
    _appConfig = config;
  }
}
