import 'package:flutter/material.dart';

import '../../layout/headers/header.dart';
import '../../layout/sidebars/sidebar.dart';

class TabletLayout extends StatelessWidget {
  TabletLayout({super.key, this.body});

  /// Widget for body layout
  final Widget? body;

  /// The global key to access of Scaffold state
  final GlobalKey<ScaffoldState>? scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: TSidebar(),
      appBar: THeader(scaffoldKey: scaffoldKey),
      body: Expanded(child: body ?? Center(child: Text('tablet body'))),
    );
  }
}
