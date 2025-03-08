import 'package:flutter/material.dart';

class CounterDisplayer extends StatelessWidget {
  const CounterDisplayer({
    super.key,
    required this.counter,
  });
  final String counter;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        border: Border.all(
          color: Colors.red,
          width: 4,
        ),
      ),
      child: Center(
        child: Text(
          counter,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
