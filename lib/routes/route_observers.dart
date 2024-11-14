import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_admin_panel/routes/routes.dart';
import 'package:get/get.dart';

import '../common/widgets/layout/sidebars/controllers /sidebar_controller.dart';

/// this class help to manager for example the sidebar navigation items wth physical desktop back button
class TRouteObservers extends GetObserver {
  // Call when the route is popped from the navigation stack.
  @override
  void didPop(Route<dynamic>? route, Route<dynamic>? previousRoute) {
    final controller = Get.put(SidebarController());

    List<String> sidebarMenuItems() {
      return (TRoutes.defaultMenuItems() + TRoutes.settingsMenuItems()).map((item) => item.route).toList();
    }

    if (previousRoute != null) {
      for (var routeName in sidebarMenuItems()) {
        if (previousRoute.settings.name == routeName) {
          controller.activeItem.value = routeName;
        }
      }
    }
  }

  @override
  void didPush(Route<dynamic>? route, Route<dynamic>? previousRoute) {}
}
