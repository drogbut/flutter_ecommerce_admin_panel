import 'package:flutter/material.dart';

class TabletLayout extends StatelessWidget {
  final Widget? body;
  const TabletLayout({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Center(child: Text('Tablet drawer')),
      ),
      appBar: AppBar(title: Text('tablet appbar')),
      body: body ?? Center(child: Text('tablet body')),
    );
  }
}
