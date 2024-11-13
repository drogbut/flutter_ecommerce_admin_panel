import 'package:flutter/material.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key, this.body});

  /// Widget for body layout
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Center(child: Text('mobile drawer')),
      ),
      appBar: AppBar(title: Text('mobile title')),
      body: body ?? Center(child: Text('mobile body')),
    );
  }
}
