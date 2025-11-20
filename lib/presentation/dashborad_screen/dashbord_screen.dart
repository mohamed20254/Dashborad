import 'dart:ui';

import 'package:admain_panel/core/responsive/app_responsive.dart';
import 'package:admain_panel/presentation/dashborad_screen/widget/header_card.dart';
import 'package:admain_panel/presentation/dashborad_screen/widget/liner_char_card.dart';
import 'package:admain_panel/presentation/dashborad_screen/widget/pie_chare_screen.dart';
import 'package:admain_panel/presentation/dashborad_screen/widget/recent_order.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashbordScreen extends StatefulWidget {
  const DashbordScreen({super.key});

  @override
  State<DashbordScreen> createState() => _DashbordScreenState();
}

class _DashbordScreenState extends State<DashbordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Dashborad", style: Theme.of(context).textTheme.titleSmall),
              SizedBox(height: 10),
              //============header
              _buildHeader(context),
              SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: AppResponsive.isDesktop(context) ? 2 : 1,
                    child: Column(
                      children: [
                        LinerChar(),
                        !AppResponsive.isDesktop(context)
                            ? PieChartPage()
                            : SizedBox(),
                        RecentOrder(),
                      ],
                    ),
                  ),
                  AppResponsive.isDesktop(context)
                      ? Expanded(child: PieChartPage())
                      : SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  GridView _buildHeader(BuildContext context) {
    return GridView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // childAspectRatio: 3.5,
        mainAxisExtent: 100,
        crossAxisCount: AppResponsive.isDesktop(context)
            ? 4
            : AppResponsive.isTablet(context)
            ? 2
            : 1,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),

      children: [
        HeaderCard(
          color: Colors.blueAccent,
          icon: Icons.microwave_outlined,
          title: "Sales Total",
          result: "\$25,970",
          prercent: "2.65",
          percentColor: Colors.green,
          arrowicon: Icons.arrow_upward,
        ),
        HeaderCard(
          color: Colors.brown,
          icon: Icons.bar_chart,
          title: "average Sales",
          result: "\$2150",
          prercent: "5.65",
          percentColor: Colors.red,
          arrowicon: Icons.arrow_downward,
        ),

        HeaderCard(
          color: Colors.deepOrange,
          icon: Icons.thumb_up_alt_outlined,
          title: "Total orders",
          result: "\$254",
          prercent: "1.65",
          percentColor: Colors.green,
          arrowicon: Icons.arrow_upward,
        ),
        HeaderCard(
          color: Colors.pink,
          icon: Icons.person_outline,
          title: "vistors",
          result: "254",
          prercent: "3.65",
          percentColor: Colors.green,
          arrowicon: Icons.arrow_upward,
        ),
      ],
    );
  }
}
