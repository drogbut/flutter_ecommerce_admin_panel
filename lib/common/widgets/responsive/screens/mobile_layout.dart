import 'package:flutter/material.dart';

import '../../layout/headers/header.dart';

class MobileLayout extends StatelessWidget {
  MobileLayout({super.key, this.body});

  /// Widget for body layout
  final Widget? body;

  /// The global key to access of Scaffold state
  final GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: Center(child: Text('mobile drawer')),
      ),
      appBar: THeader(scaffoldKey: scaffoldKey),
      body: body ?? Center(child: Text('mobile body')),
    );
  }
}
