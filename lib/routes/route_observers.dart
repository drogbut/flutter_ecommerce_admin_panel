import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// this class help to manager for example the sidebar navigation items wth physical desktop back button
class TRouteObservers extends GetObserver {
  // Call when the route is popped from the navigation stack.
  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {}

  @override
  void didPush(Route<dynamic>? route, Route<dynamic>? previousRoute) {}
}
