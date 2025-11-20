import 'package:flutter/material.dart';

class BrandScreen extends StatefulWidget {
  const BrandScreen({super.key});

  @override
  State<BrandScreen> createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandScreen> {
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(onTap: () {}, child: const Text("brands")),
      ),
    );
  }
}
