import 'package:counter_app/app/utils/command.dart';
import 'package:counter_app/app/utils/result.dart';
import 'package:counter_app/data/repositories/counter/counter_repository.dart';
import 'package:flutter/material.dart';

class MultiplicationViewModel extends ChangeNotifier {
  MultiplicationViewModel({required CounterRepository counterRepository})
      : _counterRepository = counterRepository {
    multiplication = Command0(_multiplication);
  }
  final CounterRepository _counterRepository;
  late Command0 multiplication;

  @override
  dispose() {
    multiplication.dispose();
    super.dispose();
  }

  Future<Result> _multiplication() async {
    final result = _counterRepository.multiplication();
    if (result is Error<void>) {
      print('error on addition result');
    }
    return result;
  }
}
