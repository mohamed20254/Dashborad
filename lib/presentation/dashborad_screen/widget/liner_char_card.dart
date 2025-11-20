import 'package:admain_panel/presentation/dashborad_screen/widget/barchar_screen.dart';
import 'package:flutter/material.dart';

class LinerChar extends StatelessWidget {
  const LinerChar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 240,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 18, child: Icon(Icons.timeline_rounded)),
                  SizedBox(width: 10),
                  Text(
                    "Weekly Sales",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      letterSpacing: 0.2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 150, child: BarChartPage()),
            ],
          ),
        ),
      ),
    );
  }
}
