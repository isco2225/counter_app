import 'package:counter_app/ui/counter/subtraction/view_model/view_model.dart';
import 'package:flutter/material.dart';

class SubtractionButton extends StatelessWidget {
  const SubtractionButton({super.key, required this.viewModel});
  final SubtractionViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 50,
      onPressed: () {
        viewModel.subtract.execute();
      },
      icon: Icon(
        Icons.do_not_disturb_on_total_silence,
        color: Colors.red,
      ),
    );
  }
}
