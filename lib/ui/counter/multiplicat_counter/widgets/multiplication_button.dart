import 'package:counter_app/ui/counter/multiplicat_counter/view_model/view_model.dart';
import 'package:flutter/material.dart';

class MultiplicationButton extends StatelessWidget {
  const MultiplicationButton({super.key, required this.viewModel});

  final MultiplicationViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 50,
      onPressed: () {
        viewModel.multiplication.execute();
      },
      icon: Icon(
        Icons.cancel_outlined,
        color: Colors.amber,
      ),
    );
  }
}
