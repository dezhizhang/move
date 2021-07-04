import 'package:shared_preferences/shared_preferences.dart';

class Cache {
  SharedPreferences? prefs;
  Cache._() {
    init();
  }
  static Cache? _instance;
  static Cache? getInstance() {
    if (_instance == null) {
      _instance = Cache._();
    }
    return _instance;
  }

  Cache._pre(SharedPreferences prefs) {
    this.prefs = prefs;
  }

  static Future<Cache?> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = Cache._pre(prefs);
    }
    return _instance;
  }

  void init() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

  setString(String key, String value) {
    prefs!.setString(key, value);
  }

  setDouble(String key, double value) {
    prefs!.setDouble(key, value);
  }

  setInt(String key, int value) {
    prefs!.setInt(key, value);
  }

  setStringList(String key, List<String> value) {
    prefs!.setStringList(key, value);
  }

  getString(String key) {
    return prefs!.getString(key);
  }

  getDouble(String key) {
    return prefs!.getDouble(key);
  }

  getInt(String key) {
    return prefs!.getInt(key);
  }

  getStringList(String key) {
    return prefs!.getStringList(key);
  }
}
