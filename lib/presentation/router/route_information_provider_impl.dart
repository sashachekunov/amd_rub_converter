import 'package:flutter/material.dart';

class RouteInformationProviderImpl extends PlatformRouteInformationProvider {
  RouteInformationProviderImpl()
      : super(initialRouteInformation: _defaultInitialRouteInformation);

  static final _defaultInitialRouteInformation = RouteInformation(
    location: WidgetsBinding.instance.platformDispatcher.defaultRouteName,
  );
}
