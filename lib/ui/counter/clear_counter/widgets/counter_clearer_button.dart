import 'package:counter_app/ui/counter/clear_counter/view_model/view_model.dart';
import 'package:flutter/material.dart';

class CounterClearerButton extends StatelessWidget {
  const CounterClearerButton(
      {super.key, required this.counterClearerVidewModel});

  final CounterClearerVidewModel counterClearerVidewModel;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.deepOrange,
      ),
      onPressed: () {
        counterClearerVidewModel.clearCounter.execute();
      },
      child: Text('Clear Counter'),
    );
  }
}
