import 'package:flutter/foundation.dart';
import 'package:counter_app/data/repositories/counter/counter_repository.dart';
import 'package:counter_app/app/utils/result.dart';

import '../../../../app/utils/command.dart';

class AdditionViewModel extends ChangeNotifier {
  AdditionViewModel({required CounterRepository counterRepository})
      : _counterRepository = counterRepository {
    incrementCounter = Command0(_incrementCounter);
  }

  final CounterRepository _counterRepository;

  late Command0 incrementCounter;

  @override
  dispose() {
    incrementCounter.dispose();
    super.dispose();
  }

  Future<Result> _incrementCounter() async {
    final result = await _counterRepository.addition();
    if (result is Error<void>) {
      print('error on addition result');
    }
    return result;
  }
}
