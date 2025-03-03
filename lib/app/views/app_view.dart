import 'package:flutter/material.dart';

import '../../ui/counter/counter_detail/views/views.dart';

class AppView extends StatelessWidget {
  const AppView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: CounterDetailScreen(),
      ),
    );
  }
}
