import 'package:counter_app/ui/counter/division_counter/view_model/division_view_model.dart';
import 'package:flutter/material.dart';

class DivisionButton extends StatelessWidget {
  const DivisionButton({super.key, required this.divisionViewModel});
  final DivisionViewModel divisionViewModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 50,
      onPressed: () {
        divisionViewModel.division.execute();
      },
      icon: Icon(
        Icons.safety_divider_sharp,
        color: Colors.blueAccent,
      ),
    );
  }
}
