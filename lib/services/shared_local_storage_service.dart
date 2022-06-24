import 'package:shared_preferences/shared_preferences.dart';
import 'package:wa_adopt_pet/services/local_storage_intergace.dart';

class SharedLocalStorageService extends ILocalStorage {
  @override
  Future delete(String key) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.remove(key);
  }

  @override
  Future get(String key) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.get(key);
  }

  @override
  Future put(String key, value) async {
    var sharedPrefs = await SharedPreferences.getInstance();
    if (value is String) {
      return sharedPrefs.setString(key, value);
    } else if (value is int) {
      return sharedPrefs.setInt(key, value);
    }else if (value is bool) {
      return sharedPrefs.setBool(key, value);
    }

    throw UnimplementedError();
  }
}
