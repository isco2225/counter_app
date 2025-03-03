import 'package:counter_app/app/utils/result.dart';
import 'package:counter_app/data/repositories/counter/counter_repository.dart';

class CounterRepositoryRemote extends CounterRepository {
  @override
  int get counter => _counter;
  int _counter = 0;

  @override
  Future<Result> addition() async {
    try {
      _counter += 1;
      notifyListeners();
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception("Failed to add: $e"));
    }
  }

  @override
  Future<Result> subtraction() async {
    try {
      _counter -= 1;
      notifyListeners();
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception("Failed to subtract: $e"));
    }
  }

  @override
  Future<Result> multiplication() async {
    try {
      _counter *= 2;
      notifyListeners();
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception("Failed to multiplicate: $e"));
    }
  }

  @override
  Future<Result> division() async {
    try { 
      _counter ~/= 2;
      notifyListeners();
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception("Failed to multiplicate: $e"));
    }
  }

  @override
  Future<Result> clearCounter() async {
    try {
      _counter = 0;
      notifyListeners();
      return Result.ok(null);
    } catch (e) {
      return Result.error(Exception("Failed to clear: $e"));
    }
  }
}
