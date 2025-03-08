import 'dart:async';
import 'package:counter_app/app/utils/result.dart';
import 'package:counter_app/data/repositories/counter/counter_repository.dart';
import 'package:counter_app/data/services/shared_preferences_service.dart';

class CounterRepositoryRemote extends CounterRepository {
  CounterRepositoryRemote({
    required SharedPreferencesService sharedPreferencesService,
  }) : _sharedPreferencesService = sharedPreferencesService;

  static const _counterKey = 'COUNTER';

  final SharedPreferencesService _sharedPreferencesService;

  int _counter = 0;
  @override
  int get counter => _counter;

  @override
  Future<Result<int>> getCounter() async {
    try {
      final result =
          await _sharedPreferencesService.getIntager(key: _counterKey);
      switch (result) {
        case Ok():
          _counter = result.value;
          notifyListeners();
          return Result.ok(_counter);
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  Future<Result> _updateCounter(int newValue) async {
    try {
      final result = await _sharedPreferencesService.saveIntager(
        key: _counterKey,
        counter: newValue,
      );
      switch (result) {
        case Ok():
          _counter = newValue;
          notifyListeners();
          return Result.ok(null);
        case Error():
          return Result.error(result.error);
      }
    } on Exception catch (e) {
      return Result.error(e);
    }
  }

  @override
  Future<Result> addition() async => await _updateCounter(_counter + 1);

  @override
  Future<Result> subtraction() async => await _updateCounter(_counter - 1);

  @override
  Future<Result> multiplication() async => await _updateCounter(_counter * 2);

  @override
  Future<Result> division({required int numberToDivide}) async =>
      await _updateCounter(_counter ~/ numberToDivide);

  @override
  Future<Result> clearCounter() async => await _updateCounter(0);
}
