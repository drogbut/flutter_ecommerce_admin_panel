import 'package:get/get.dart';

import '../../../../../routes/routes.dart';
import '../../../../../utils/device/device_utility.dart';

class SidebarController extends GetxController {
  final activeItem = TRoutes.login.obs;
  final hoverItem = ''.obs;

  /// Change the active item to the selected route
  void changeActiveItem(String route) => activeItem.value = route;

  /// Change the hover item to the specified item
  void changeHoverItem(String route) {
    if (!isActive(route)) hoverItem.value = route;
  }

  /// Check if the item is the currently active item
  bool isActive(String itemName) => activeItem.value == itemName;

  /// Check if the item is currently being hovered over
  bool isHovering(String itemName) => hoverItem.value == itemName;

  /// Action to take when a menu item is tapped
  void menuOnTap(String route) {
    if (!isActive(route)) {
      changeActiveItem(route);
      if (TDeviceUtils.isMobileScreen(Get.context!)) Get.back();
    }
  }
}
