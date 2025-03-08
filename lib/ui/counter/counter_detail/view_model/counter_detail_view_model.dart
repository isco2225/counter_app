import 'package:counter_app/data/repositories/counter/counter_repository.dart';
import 'package:flutter/foundation.dart';

class CounterDetailViewModel extends ChangeNotifier {
  CounterDetailViewModel({required CounterRepository counterRepository})
      : _counterRepository = counterRepository {
    counterRepository.addListener(_syncCounter);
    _loadCounter();
  }

  final CounterRepository _counterRepository;

  int get counter => _counterRepository.counter;

  @override
  void dispose() {
    _counterRepository.removeListener(_syncCounter);
    super.dispose();
  }

  Future<void> _loadCounter() async {
    await _counterRepository.getCounter();
  
  }

  void _syncCounter() async {
    print("Counter değişti: $counter");
    notifyListeners();
    //await _loadCounter();
  }
}
