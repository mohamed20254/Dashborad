import 'package:admain_panel/core/responsive/app_responsive.dart';
import 'package:admain_panel/presentation/main_screen/widget/drawer_screen.dart';
import 'package:flutter/material.dart';

import '../widget/appbar.dart';

class Mainscreen extends StatefulWidget {
  final Widget child;

  const Mainscreen({super.key, required this.child});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: AppResponsive.isDesktop(context),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),

            width: 250,

            child: DrawerScreen(scaffoldkeu: scaffoldKey),
          ),
        ),
        Expanded(
          child: Scaffold(
            key: scaffoldKey,
            drawer: Drawer(child: DrawerScreen(scaffoldkeu: scaffoldKey)),
            appBar: appBar(context),

            body: widget.child,
          ),
        ),
      ],
    );
  }
}
