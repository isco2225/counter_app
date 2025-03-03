import 'package:counter_app/data/repositories/counter/counter_repository.dart';
import 'package:flutter/foundation.dart';

class CounterDetailViewModel extends ChangeNotifier {
  CounterDetailViewModel({required this.counterRepository}) {
    counterRepository.addListener(_syncCounter);
  }
  final CounterRepository counterRepository;

  @override
  void dispose() {
    counterRepository.removeListener(_syncCounter);
    super.dispose();
  }


  int get counter => counterRepository.counter;

  void _syncCounter() {
    print(counter);
    notifyListeners();
  }
}
