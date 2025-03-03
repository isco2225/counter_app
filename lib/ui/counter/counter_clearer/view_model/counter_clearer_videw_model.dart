import 'package:counter_app/app/utils/command.dart';
import 'package:counter_app/app/utils/result.dart';
import 'package:counter_app/data/repositories/counter/counter_repository.dart';
import 'package:flutter/material.dart';

class CounterClearerVidewModel extends ChangeNotifier {
  CounterClearerVidewModel(CounterRepository counterRepository)
      : _counterRepository = counterRepository {
    clearCounter = Command0(_clearCounter);
  }
  final CounterRepository _counterRepository;

  @override
  dispose() {
    clearCounter.dispose();
    super.dispose();
  }

  late Command0 clearCounter;

  Future<Result> _clearCounter() async {
    final result = _counterRepository.clearCounter();
    if (result is Error<void>) {
      print('error on clearCounter result');
    }
    return result;
  }
}
