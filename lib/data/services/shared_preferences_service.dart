import 'package:counter_app/app/utils/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferences? _sharedPreferences;

  Future<SharedPreferences> get _prefs async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  Future<Result<int>> getIntager({required String key}) async {
    try {
      final sharedPreferences = await _prefs;
      final counter = sharedPreferences.getInt(key) ?? 0;
      return Result.ok(counter);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result<void>> saveIntager(
      {required String key, required int counter}) async {
    try {
      final sharedPreferences = await _prefs;
      final isSaved = await sharedPreferences.setInt(key, counter);
      if (!isSaved) {
        return Result.error(Exception('Failed to save counter'));
      }
      return Result.ok(null);
    } on Exception catch (e) {
      return Result.error(e);
    }
  }
}
