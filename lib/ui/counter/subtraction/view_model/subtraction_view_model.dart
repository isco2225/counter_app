import 'package:counter_app/app/utils/command.dart';
import 'package:counter_app/data/repositories/counter/counter_repository.dart';
import 'package:flutter/material.dart';

import '../../../../app/utils/result.dart';

class SubtractionViewModel extends ChangeNotifier {
  SubtractionViewModel({
    required CounterRepository counterRepository,
  }) : _counterRepository = counterRepository {
    subtract = Command0(_subtractCounter);
  }
  final CounterRepository _counterRepository;
  
  late Command0 subtract;

  @override
  dispose() {
    subtract.dispose();
    super.dispose();
  }

  Future<Result> _subtractCounter() async {
    final result = await _counterRepository.subtraction();
    if (result is Error<void>) {
      print('error on addition result');
    }
    return result;
  }
}
