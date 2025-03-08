import 'package:counter_app/app/views/app_screen.dart';
import 'package:counter_app/data/repositories/counter/counter_repository_remote.dart';
import 'package:counter_app/data/services/shared_preferences_service.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferencesService = SharedPreferencesService();
  runApp(
    AppScreen(
      counterRepository: CounterRepositoryRemote(
        sharedPreferencesService: sharedPreferencesService,
      ),
    ),
  );
}
