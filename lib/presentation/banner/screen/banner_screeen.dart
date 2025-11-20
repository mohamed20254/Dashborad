import 'package:flutter/material.dart';

class BannerScreeen extends StatefulWidget {
  const BannerScreeen({super.key});

  @override
  State<BannerScreeen> createState() => _BannerScreeenState();
}

class _BannerScreeenState extends State<BannerScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Banner")));
  }
}
