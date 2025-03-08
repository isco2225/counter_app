import 'package:counter_app/app/utils/command.dart';
import 'package:counter_app/app/utils/result.dart';
import 'package:counter_app/data/repositories/counter/counter_repository.dart';
import 'package:flutter/material.dart';

class DivisionViewModel extends ChangeNotifier {
  DivisionViewModel({required CounterRepository counterRepository})
      : _counterRepository = counterRepository {
    division = Command1(_division);
  }
  final CounterRepository _counterRepository;
  late Command1<void, ({int numberToDivide})> division;
  String? errorMessage;

  @override
  dispose() {
    division.dispose();
    super.dispose();
  }

  int get counter => _counterRepository.counter;

  Future<Result> _division(({int numberToDivide}) commands) async {
    if (commands.numberToDivide == 0) {
      errorMessage = "$counter, Sıfır ile bölünemez.";
      notifyListeners();
      return Result.error(Exception(errorMessage));
    }
    if (counter % commands.numberToDivide != 0) {
      errorMessage = "$counter, ${commands.numberToDivide} ile tam bölünemez.";
      notifyListeners();
      return Result.error(Exception(errorMessage));
    }

    final result = await _counterRepository.division(
        numberToDivide: commands.numberToDivide);
    if (result is Error<void>) {
      errorMessage = result.exception.toString();
    } else {
      errorMessage = null;
    }

    notifyListeners();
    return result;
  }
}
