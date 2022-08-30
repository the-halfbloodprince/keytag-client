import 'package:flutter/widgets.dart';
import 'package:hostel_keys_management/models/config.dart';

class ConfigProvider with ChangeNotifier {
  Config _appConfig;
  Config get appConfig => _appConfig;
  ConfigProvider(this._appConfig);
}
