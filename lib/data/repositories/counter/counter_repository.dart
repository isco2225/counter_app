import 'package:counter_app/app/utils/result.dart';
import 'package:flutter/material.dart';

abstract class CounterRepository extends ChangeNotifier {
  int get counter;
  Future<Result> addition();
  Future<Result> subtraction();
  Future<Result> multiplication();
  Future<Result> division();
  Future<Result> clearCounter();
  Future<Result<int>> getCounter();
}
