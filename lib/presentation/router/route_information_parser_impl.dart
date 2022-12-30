import 'package:amd_rub_converter/presentation/core/routes.dart';
import 'package:amd_rub_converter/presentation/bloc/navigation/navigation_cubit.dart';

import 'package:flutter/material.dart';

class RouteInformationParserImpl = RouteInformationParser<NavigationState>
    with _RestoreRouteInformationMixin, _ParseRouteInformationMixin;

mixin _RestoreRouteInformationMixin on RouteInformationParser<NavigationState> {
  @override
  RouteInformation? restoreRouteInformation(NavigationState configuration) =>
      RouteInformation(location: configuration.toRoute());
}

mixin _ParseRouteInformationMixin on RouteInformationParser<NavigationState> {
  @override
  Future<NavigationState> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    if (routeInformation.location == Routes.currencyConverter ||
        routeInformation.location ==
            WidgetsBinding.instance.platformDispatcher.defaultRouteName) {
      return const CurrencyConverter();
    } else if (routeInformation.location == Routes.exchangeRateEditor) {
      return const ExchangeRateEditor();
    }

    return const ErrorNotFound();
  }
}
