import 'package:counter_app/ui/counter/division_counter/view_model/division_view_model.dart';
import 'package:flutter/material.dart';

class DivisionButton extends StatefulWidget {
  const DivisionButton(
      {super.key,
      required this.divisionViewModel,
      required this.numberToDivide});
  final DivisionViewModel divisionViewModel;
  final TextEditingController numberToDivide;

  @override
  State<DivisionButton> createState() => _DivisionButtonState();
}

class _DivisionButtonState extends State<DivisionButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 50,
      onPressed: () {
        final int? parsedNumber = int.tryParse(widget.numberToDivide.text);
        if (parsedNumber == null || parsedNumber == 0) return;
        widget.divisionViewModel.division.execute((numberToDivide: parsedNumber));
      },
      icon: Icon(
        Icons.safety_divider_sharp,
        color: Colors.blueAccent,
      ),
    );
  }
}
