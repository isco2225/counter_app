import 'package:counter_app/app/utils/command.dart';
import 'package:counter_app/app/utils/result.dart';
import 'package:counter_app/data/repositories/counter/counter_repository.dart';
import 'package:flutter/material.dart';

class DivisionViewModel extends ChangeNotifier {
  DivisionViewModel({required CounterRepository counterRepository})
      : _counterRepository = counterRepository {
    division = Command0(_division);
  }
  final CounterRepository _counterRepository;
  late Command0 division;
  String? errorMessage;

  @override
  dispose() {
    division.dispose();
    super.dispose();
  }

  int get counter => _counterRepository.counter;

  Future<Result> _division() async {
   /* if (counter == 0) {
      errorMessage = "Sıfır ile bölünemez.";
      notifyListeners();
      return Result.error(Exception(errorMessage));
    }
    if (counter % 2 != 0) {
      errorMessage = "İkiye tam bölünmüyor.";
      notifyListeners();
      return Result.error(Exception(errorMessage));
    }*/

    final result = await _counterRepository.division();
    if (result is Error<void>) {
      errorMessage = result.exception.toString();
    } else {
      errorMessage = null; 
    }

    notifyListeners();
    return result;
  }
}
