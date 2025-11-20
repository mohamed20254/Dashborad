import 'package:admain_panel/app/routing/app_routing.dart';
import 'package:admain_panel/core/constant/app_icons.dart';
import 'package:admain_panel/core/helper/app_validation.dart';
import 'package:admain_panel/core/responsive/app_responsive.dart';
import 'package:admain_panel/view_model/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppResponsive.isMobile(context) ? 10 : 10,
        ),
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: AppResponsive.isDesktop(context)
              ? 150
              : AppResponsive.isTablet(context)
              ? 20
              : 0,
          vertical: AppResponsive.isDesktop(context)
              ? 80
              : AppResponsive.isTablet(context)
              ? 20
              : 0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Center(
          child: SizedBox(
            width: AppResponsive.isMobile(context) ? null : 300,
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Image.asset(AppIcons.logo, height: 100),
                  Text(
                    'Login Screen',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'please login to your account',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),

                  const SizedBox(height: 10),
                  CustomTextFiled(
                    icon: Icons.email_outlined,
                    controller: emailController,
                    labelText: "Email",
                    autofocus: true,
                    validator: AppValidators.validateEmail,
                  ),
                  const SizedBox(height: 15),
                  CustomTextFiled(
                    controller: passwordController,
                    icon: Icons.lock_clock_outlined,
                    labelText: "Password",
                    validator: AppValidators.validatePassword,
                  ),
                  const SizedBox(height: 30),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (final context, final state) {
                      if (state is AuthFailure) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.message)));
                      } else if (state is Authenticated) {
                        Router.neglect(
                          context,
                          () => context.goNamed(RouteNames.dashbordScreen),
                        );
                      }
                    },
                    builder: (final context, final state) {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              context
                                  .read<AuthCubit>()
                                  .loginWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                          ),

                          child: state is AuthLoading
                              ? Transform.scale(
                                  scale: 0.6,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  "Login",
                                  style: Theme.of(context).textTheme.bodyLarge!
                                      .copyWith(color: Colors.white),
                                ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    this.validator,
    this.autofocus = false,
    required this.labelText,
    required this.icon,
    this.controller,
  });
  final String labelText;
  final IconData icon;
  final TextEditingController? controller;

  final String? Function(String?)? validator;
  final bool autofocus;
  @override
  Widget build(final BuildContext context) {
    return TextFormField(
      controller: controller,
      autofocus: autofocus,
      validator: validator,

      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Theme.of(context).primaryColor),
        labelStyle: Theme.of(context).textTheme.bodyMedium,
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
