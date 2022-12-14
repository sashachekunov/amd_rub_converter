import 'package:amd_rub_converter/presentation/screens/screen_builder.dart';
import 'package:amd_rub_converter/presentation/bloc/navigation/navigation_cubit.dart';

import 'package:flutter/material.dart';

class RouterDelegateImpl extends RouterDelegate<NavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationState> {
  final NavigationCubit navigation;

  RouterDelegateImpl(this.navigation) {
    navigation.stream.distinct().forEach((state) => notifyListeners());
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  NavigationState get currentConfiguration => navigation.state;

  @override
  Future<void> setInitialRoutePath(NavigationState configuration) async =>
      navigation.initNavigationState();

  @override
  Future<void> setNewRoutePath(NavigationState configuration) async =>
      navigation.setNavigationState(configuration);

  @override
  Future<bool> popRoute() async {
    if (currentConfiguration.prevState == null) return false;
    return _popPage();
  }

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        pages: [
          if (currentConfiguration.prevState != null)
            MaterialPage(child: ScreenBuilder(currentConfiguration.prevState)),
          MaterialPage(child: ScreenBuilder(currentConfiguration)),
        ],
        onPopPage: _onPopPage,
      );

  bool _onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) return false;
    return _popPage();
  }

  bool _popPage() {
    navigation.resetPrevNavigationState();
    return true;
  }
}
