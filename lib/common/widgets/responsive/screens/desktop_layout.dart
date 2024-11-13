import 'package:flutter/material.dart';

import '../../containers/rounded_container.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.body});

  /// Widget for body layout
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          /// LEFT
          Expanded(
              child: const Drawer(
            child: Center(child: Text('desktop drawer')),
          )),

          /// RIGHT
          Expanded(
              flex: 5,
              child: Column(
                children: [
                  /// HEADER
                  TRoundedContainer(
                    width: double.infinity,
                    height: 75,
                    backgroundColor: Colors.yellow.withOpacity(0.2),
                    child: Center(child: Text('Desktop appbar')),
                  ),

                  /// BODY
                  body ?? Center(child: Text('desktop body')),
                ],
              )),
        ],
      ),
    );
  }
}
