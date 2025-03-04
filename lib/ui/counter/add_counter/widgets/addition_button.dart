import 'package:counter_app/ui/counter/add_counter/view_model/addition_view_model.dart';
import 'package:flutter/material.dart';

class AdditionButton extends StatelessWidget {
  const AdditionButton({super.key, required this.viewModel});
  final AdditionViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 50,
      onPressed: () {
        viewModel.incrementCounter.execute();
      },
      icon: Icon(
        Icons.add_circle_outline_outlined,
        color: Colors.green,
      ),
    );
  }
}
