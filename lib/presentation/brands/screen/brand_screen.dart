import 'package:admain_panel/app/routing/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(onTap: () {}, child: Text("brands")),
      ),
    );
  }
}
