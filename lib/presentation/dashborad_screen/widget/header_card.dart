import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.result,
    required this.prercent,
    required this.percentColor,
    required this.arrowicon,
  });
  final Color color;
  final IconData icon;
  final String title;
  final String result;
  final String prercent;
  final Color percentColor;
  final IconData arrowicon;

  @override
  Widget build(final BuildContext context) {
    return Card(
      color: Colors.white,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: color.withValues(alpha: 0.2),
                  child: Icon(icon, color: color, size: 15),
                ),
                const SizedBox(width: 10),
                Text(title, style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  result,
                  style: Theme.of(context).textTheme.labelLarge,
                  overflow: TextOverflow.ellipsis,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Icon(arrowicon, size: 13, color: percentColor),
                        Text(
                          "$prercent %",
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(color: percentColor),
                        ),
                      ],
                    ),
                    Text(
                      "Compared to dec 2023",
                      style: Theme.of(
                        context,
                      ).textTheme.labelSmall!.copyWith(fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
