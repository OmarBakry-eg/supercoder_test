import 'package:shared_preferences/shared_preferences.dart';

base class LocalSource {
  final SharedPreferences sharedPreferences;
  const LocalSource(this.sharedPreferences);

  Future<bool> setToken(String value) async {
    return await sharedPreferences.setString('token', value);
  }

  String? get token => sharedPreferences.getString('token');



  Future<bool> setCharacterID(String value) async {
    return await sharedPreferences.setString('characterid', value);
  }

  String? get getStoredCharacterID => sharedPreferences.getString('characterid');
}
