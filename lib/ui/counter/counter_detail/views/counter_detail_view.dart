import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../counter.dart';

class CounterDetailView extends StatefulWidget {
  const CounterDetailView({
    super.key,
  });
  @override
  State<CounterDetailView> createState() => _CounterDetailViewState();
}

class _CounterDetailViewState extends State<CounterDetailView> {
  late final CounterDetailViewModel _viewModel;
  late final AdditionViewModel _additionViewModel;
  late final SubtractionViewModel _subtractionViewModel;
  late final MultiplicationViewModel _multiplicationViewModel;
  late final DivisionViewModel _divisionViewModel;
  late final CounterClearerVidewModel _counterClearerVidewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CounterDetailViewModel(
      counterRepository: context.read(),
    );
    _additionViewModel = AdditionViewModel(
      counterRepository: context.read(),
    );
    _subtractionViewModel = SubtractionViewModel(
      counterRepository: context.read(),
    );
    _multiplicationViewModel = MultiplicationViewModel(
      counterRepository: context.read(),
    );
    _divisionViewModel = DivisionViewModel(
      counterRepository: context.read(),
    );
    _counterClearerVidewModel = CounterClearerVidewModel(
      context.read(),
    );
    _divisionViewModel.division.addListener(_onDivision);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _additionViewModel.dispose();
    _subtractionViewModel.dispose();
    _multiplicationViewModel.dispose();
    _divisionViewModel.dispose();
    _counterClearerVidewModel.dispose();
    _divisionViewModel.division.removeListener(_onDivision);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ListenableBuilder(
              listenable: Listenable.merge([
                _viewModel,
              ]),
              builder: (context, child) {
                return CounterDisplayer(
                  counter: _viewModel.counter.toString(),
                );
              },
            ),
            CounterClearerButton(
              counterClearerVidewModel: _counterClearerVidewModel,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AdditionButton(
                  viewModel: _additionViewModel,
                ),
                SubtractionButton(
                  viewModel: _subtractionViewModel,
                ),
                MultiplicationButton(
                  viewModel: _multiplicationViewModel,
                ),
                DivisionButton(
                  divisionViewModel: _divisionViewModel,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onDivision() {
    if (_divisionViewModel.division.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content:
              Text(_divisionViewModel.errorMessage ?? 'bilinmeyen bir hata'),
        ),
      );
    }
  }
}
