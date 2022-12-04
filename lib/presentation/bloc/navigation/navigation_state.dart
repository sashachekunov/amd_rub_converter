part of 'navigation_cubit.dart';

abstract class NavigationState {
  final NavigationState? prevState;

  const NavigationState([this.prevState]);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NavigationState &&
          runtimeType == other.runtimeType &&
          prevState == other.prevState;

  @override
  int get hashCode => prevState.hashCode;
}

class ExchangeRateEditor extends NavigationState {
  const ExchangeRateEditor([super.prevState]);

  @override
  String toString() => Routes.exchangeRateEditor;
}

class CurrencyConverter extends NavigationState {
  const CurrencyConverter([super.prevState]);

  @override
  String toString() => Routes.currencyConverter;
}

class ErrorNotFound extends NavigationState {
  const ErrorNotFound([super.prevState]);

  @override
  String toString() => Routes.error;
}
