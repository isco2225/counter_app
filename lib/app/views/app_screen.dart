import 'package:counter_app/data/repositories/counter/counter_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key, required this.counterRepository});
  final CounterRepository counterRepository;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => counterRepository,
        ),
      ],
      child: AppView(
        title: 'abc',
      ),
    );
  }
}
