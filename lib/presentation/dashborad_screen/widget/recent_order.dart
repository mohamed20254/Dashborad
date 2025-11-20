import 'dart:ui';
import 'package:flutter/material.dart';

class Order {
  final String id;
  final String productName;
  final String date;
  final double amount;
  bool isSelected;
  String status;

  Order({
    required this.id,
    required this.productName,
    required this.date,
    required this.amount,
    this.isSelected = false,
    this.status = "Pending",
  });
}

class RecentOrder extends StatefulWidget {
  const RecentOrder({super.key});

  @override
  State<RecentOrder> createState() => _RecentOrderState();
}

class _RecentOrderState extends State<RecentOrder> {
  final List<Order> recentOrders = [
    // ملابس
    Order(
      id: "001",
      productName: "T-Shirt",
      date: "19/11/2025",
      amount: 15.0,
      status: "Completed",
    ),
    Order(id: "002", productName: "Jeans", date: "18/11/2025", amount: 40.0),
    Order(
      id: "003",
      productName: "Jacket",
      date: "17/11/2025",
      amount: 60.0,
      status: "Completed",
    ),
    Order(id: "004", productName: "Sneakers", date: "16/11/2025", amount: 80.0),
    Order(
      id: "005",
      productName: "Cap",
      date: "15/11/2025",
      amount: 12.0,
      status: "Completed",
    ),
    Order(id: "006", productName: "Socks", date: "14/11/2025", amount: 5.0),

    // إلكترونيات
    Order(
      id: "007",
      productName: "Smartphone",
      date: "13/11/2025",
      amount: 500.0,
      status: "Completed",
    ),
    Order(id: "008", productName: "Laptop", date: "12/11/2025", amount: 1200.0),
    Order(
      id: "009",
      productName: "Headphones",
      date: "11/11/2025",
      amount: 80.0,
      status: "Completed",
    ),
    Order(
      id: "010",
      productName: "Smartwatch",
      date: "10/11/2025",
      amount: 150.0,
    ),
    Order(
      id: "011",
      productName: "Camera",
      date: "09/11/2025",
      amount: 700.0,
      status: "Completed",
    ),
    Order(id: "012", productName: "Tablet", date: "08/11/2025", amount: 350.0),

    // ملابس
    Order(
      id: "013",
      productName: "Dress",
      date: "07/11/2025",
      amount: 45.0,
      status: "Completed",
    ),
    Order(id: "014", productName: "Hoodie", date: "06/11/2025", amount: 35.0),

    // إلكترونيات
    Order(
      id: "015",
      productName: "Gaming Console",
      date: "05/11/2025",
      amount: 400.0,
      status: "Completed",
    ),
    Order(
      id: "016",
      productName: "Bluetooth Speaker",
      date: "04/11/2025",
      amount: 60.0,
    ),

    // ملابس
    Order(
      id: "017",
      productName: "Skirt",
      date: "03/11/2025",
      amount: 30.0,
      status: "Completed",
    ),

    // إلكترونيات
    Order(id: "018", productName: "Monitor", date: "02/11/2025", amount: 220.0),
  ];
  bool isallslecteed = false;
  @override
  Widget build(final BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final ScrollController scrollController2 = ScrollController();
    return SizedBox(
      height: 585,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsetsGeometry.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.deepPurpleAccent.withValues(
                      alpha: 0.3,
                    ),
                    child: const Icon(Icons.pix_rounded),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Recent Order",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 10),

              SizedBox(
                height: 450,

                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse, // هذا يسمح بالسحب بالماوس
                    },
                  ),

                  child: Scrollbar(
                    controller: scrollController,

                    thumbVisibility: true,
                    child: ListView(
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Column(
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 800),
                              child: customRow(
                                ismain: true,
                                context,
                                amount: "Amount",
                                date: "Date",
                                id: "Order ID",
                                name: "Name",
                                status: "Status",
                                ledding: Checkbox(
                                  value: isallslecteed,
                                  onChanged: (final value) {
                                    recentOrders.forEach(
                                      (final element) =>
                                          element.isSelected = value ?? false,
                                    );
                                    isallslecteed = value ?? false;

                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 800,
                                ),

                                child: Scrollbar(
                                  controller: scrollController2,

                                  child: ListView.builder(
                                    controller: scrollController2,
                                    shrinkWrap: true,
                                    itemCount: recentOrders.length,
                                    itemBuilder: (final context, final index) {
                                      return customRow(
                                        ledding: Checkbox(
                                          value: recentOrders[index].isSelected,
                                          onChanged: (final value) {
                                            setState(() {
                                              recentOrders[index].isSelected =
                                                  value ?? true;
                                            });
                                          },
                                        ),
                                        context,
                                        id: recentOrders[index].id,
                                        name: recentOrders[index].productName,
                                        date: recentOrders[index].date,
                                        amount: recentOrders[index].status,
                                        status: recentOrders[index].status,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      recentOrders.forEach((final element) {
                        if (element.isSelected == true) {
                          recentOrders.remove(element);
                        }
                        setState(() {});
                      });
                    },
                    icon: const Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container customRow(
    final BuildContext context, {
    required final String id,
    required final String name,
    required final String date,
    required final String amount,
    required final String status,
    final Widget? ledding,
    final bool ismain = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: ismain ? Colors.grey[100] : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          sizeboxInRow(context, text: id, ledding: ledding),
          sizeboxInRow(context, text: name),
          sizeboxInRow(context, text: date),
          sizeboxInRow(context, text: amount),
          sizeboxInRow(context, text: status),
        ],
      ),
    );
  }

  SizedBox sizeboxInRow(
    final BuildContext context, {
    required final String text,
    final Widget? ledding,
  }) {
    return SizedBox(
      width: 100,
      child: Row(
        children: [
          ledding ?? const SizedBox(),
          Text(
            text,
            style: Theme.of(context).textTheme.labelLarge,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
