import 'package:flutter/material.dart';

import '../../../core/helper/my_network_web_image.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("order")),
      body: Column(
        children: [
          Center(
            child: WebImageWidget(
              imageUrl:
                  "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEiqZv-HzPrZPKxVoclXKLHJyL3ZO8lfs8K3K_bq_HGX8QdJpksLZkc7nMyvNmFoaveFuiYz3ZjLsM2h01iERjpvWBaSfqqOuiqnVgFa3w5egWqNDE_LyGKzk914xncTOE9t9uZ1DDj0JGuC/s1600/package_1.png",
            ),
          ),
        ],
      ),
    );
  }
}
