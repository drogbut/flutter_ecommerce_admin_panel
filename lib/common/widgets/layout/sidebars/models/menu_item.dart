import 'package:flutter/material.dart';

class MenuItem {
  final String route;
  final IconData icon;
  final String itemName;

  const MenuItem({
    required this.route,
    required this.icon,
    required this.itemName,
  });

  /// Static constructor for returning a default list of menu items
  static List<MenuItem> defaultMenuItems() {
    return [
      MenuItem(route: '/dashboard', icon: Icons.home, itemName: 'Dashboard'),
      MenuItem(route: '/media', icon: Icons.person, itemName: 'Media'),
      MenuItem(route: '/banners', icon: Icons.settings, itemName: 'Banners'),
      MenuItem(route: '/products', icon: Icons.notifications, itemName: 'Products'),
      MenuItem(route: '/categories', icon: Icons.help, itemName: 'Categories'),
      MenuItem(route: '/customers', icon: Icons.info, itemName: 'Customers'),
      MenuItem(route: '/orders', icon: Icons.info, itemName: 'customers'),
      MenuItem(route: '/coupons', icon: Icons.info, itemName: 'coupons'),
    ];
  }

  /// Static constructor for returning a default list of menu items
  static List<MenuItem> settingsMenuItems() {
    return [
      MenuItem(route: '/profile', icon: Icons.person, itemName: 'Profile'),
      MenuItem(route: '/settings', icon: Icons.settings, itemName: 'Settings'),
      MenuItem(route: '/notifications', icon: Icons.notifications, itemName: 'Notifications'),
      MenuItem(route: '/help', icon: Icons.help, itemName: 'Help'),
      MenuItem(route: '/about', icon: Icons.info, itemName: 'About'),
    ];
  }
}
