import 'package:flutter/material.dart';

import '../../../core/responsive/app_responsive.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: !AppResponsive.isDesktop(context),
    backgroundColor: Colors.white,
    title: AppResponsive.isDesktop(context)
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: 250,
            height: 40,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.black),
            ),
            child: Row(
              children: [
                Icon(Icons.search, size: 15),
                Text(
                  "Search...",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          )
        : SizedBox(),
    actions: [
      !AppResponsive.isDesktop(context)
          ? IconButton(onPressed: () {}, icon: Icon(Icons.search))
          : SizedBox(),

      IconButton(
        onPressed: () {},
        icon: Icon(Icons.notifications_none_outlined),
      ),

      Row(
        children: [
          CircleAvatar(child: Icon(Icons.person)),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "admain",
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w900),
              ),

              Text(
                "DashBord Admain  ",
                style: Theme.of(context).textTheme.labelLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
