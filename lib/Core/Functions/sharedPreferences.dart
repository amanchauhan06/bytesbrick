import 'package:shared_preferences/shared_preferences.dart';

Future<bool> saveData({String saveKey, String saveValue}) async {
  final prefs = await SharedPreferences.getInstance();
  final value = prefs.setString(saveKey, saveValue);
  if (value != null) {
    print(value);
    return true;
  } else {
    return false;
  }
}

Future<String> readData(String readKey) async {
  final prefs = await SharedPreferences.getInstance();
  final key = '$readKey';
  final value = prefs.getString(key) ?? null;
  return value;
}
