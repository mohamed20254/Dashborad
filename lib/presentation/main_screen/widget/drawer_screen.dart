import 'package:admain_panel/app/routing/app_routing.dart';
import 'package:admain_panel/core/constant/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldkeu;
  const DrawerScreen({super.key, required this.scaffoldkeu});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    final String cuurentbage = GoRouter.of(context).state.name ?? "";
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(right: 3),
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(AppIcons.logo, height: 80)),
              SizedBox(height: 10),
              Text("MENU", style: Theme.of(context).textTheme.bodySmall),

              /// DASHBORD
              CustomCardDrawer(
                cuurentbage: cuurentbage,
                routName: RouteNames.dashbordScreen,
                icon: Icons.dashboard,
                ontap: () {
                  Router.neglect(
                    context,
                    () => context.goNamed(RouteNames.dashbordScreen),
                  );
                  _closeDrawer();
                },
              ),

              /// category
              CustomCardDrawer(
                cuurentbage: cuurentbage,
                routName: RouteNames.categoriesScreen,
                icon: Icons.category,
                ontap: () {
                  Router.neglect(
                    context,
                    () => context.goNamed(RouteNames.categoriesScreen),
                  );
                  _closeDrawer();
                },
              ),
              // products
              CustomCardDrawer(
                cuurentbage: cuurentbage,
                routName: RouteNames.products,
                icon: Icons.production_quantity_limits,
                ontap: () {
                  Router.neglect(
                    context,
                    () => context.goNamed(RouteNames.products),
                  );
                  _closeDrawer();
                },
              ),
              // orders
              CustomCardDrawer(
                cuurentbage: cuurentbage,
                routName: RouteNames.orderScreen,
                icon: Icons.shopping_cart,
                ontap: () {
                  Router.neglect(
                    context,
                    () => context.goNamed(RouteNames.orderScreen),
                  );
                  _closeDrawer();
                },
              ),
              //banners
              CustomCardDrawer(
                cuurentbage: cuurentbage,
                routName: RouteNames.user,
                icon: Icons.supervised_user_circle_rounded,
                ontap: () {
                  Router.neglect(
                    context,
                    () => context.goNamed(RouteNames.user),
                  );
                  _closeDrawer();
                },
              ),
              //brand
              CustomCardDrawer(
                cuurentbage: cuurentbage,
                routName: RouteNames.brandScreen,
                icon: Icons.branding_watermark,
                ontap: () {
                  Router.neglect(
                    context,
                    () => context.goNamed(RouteNames.brandScreen),
                  );
                  _closeDrawer();
                },
              ),
              CustomCardDrawer(
                cuurentbage: cuurentbage,
                routName: "setting",
                icon: Icons.branding_watermark,
                ontap: () {
                  Router.neglect(
                    context,
                    () => context.goNamed(RouteNames.brandScreen),
                  );
                  _closeDrawer();
                },
              ),
              CustomCardDrawer(
                cuurentbage: cuurentbage,
                routName: "profile",
                icon: Icons.branding_watermark,
                ontap: () {
                  Router.neglect(
                    context,
                    () => context.goNamed(RouteNames.brandScreen),
                  );
                  _closeDrawer();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _closeDrawer() {
    widget.scaffoldkeu.currentState?.isDrawerOpen ?? false
        ? Navigator.of(context).pop()
        : null;
  }
}

class CustomCardDrawer extends StatelessWidget {
  final String cuurentbage;
  final String routName;
  final void Function() ontap;
  final IconData icon;
  const CustomCardDrawer({
    super.key,
    required this.cuurentbage,
    required this.routName,
    required this.ontap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        color: cuurentbage == routName
            ? const Color.fromARGB(108, 2, 70, 187).withValues(alpha: 0.6)
            : Colors.white,
        child: ListTile(
          leading: Icon(
            icon,
            color: cuurentbage == routName ? Colors.white : Colors.grey,
          ),
          title: Text(
            routName,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: cuurentbage == routName ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
