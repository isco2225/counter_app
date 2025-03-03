import 'package:counter_app/app/views/app_screen.dart';
import 'package:counter_app/data/repositories/counter/counter_repository_remote.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    AppScreen(
      counterRepository: CounterRepositoryRemote(),
    ),
  );
}
