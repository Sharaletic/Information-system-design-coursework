import 'package:coursework_pis/core/custom_snack_bar.dart';
import 'package:coursework_pis/core/routes/routes_name.dart';
import 'package:coursework_pis/core/theme/app_colors.dart';
import 'package:coursework_pis/core/utils/app_strings.dart';
import 'package:coursework_pis/core/widgets/custom_text_form_field.dart';
import 'package:coursework_pis/core/widgets/rounded_elevated_button.dart';
import 'package:coursework_pis/presentation/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void clear() {
    _loginController.clear();
    _passwordController.clear();
  }

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.map(
              success: (_) {
                clear();
                context.goNamed(RoutesNames.teacher);
              },
              initial: (_) {},
              failure: (state) {
                CustomSnackBar.showError(context, state.message);
              },
              loading: (_) {},
            );
          },
          child: Form(
              child: Column(
            children: [
              CustomTextFormField(
                controller: _loginController,
                hintText: AppStrings.login,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.required;
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                obscureText: false,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                controller: _passwordController,
                hintText: AppStrings.password,
                validator: (value) {
                  if (value!.isEmpty) {
                    return AppStrings.required;
                  }
                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: isPasswordVisible,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  child: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RoundedElevatedButton(
                onPressed: () {
                  context.read<AuthBloc>().add(AuthEvent.login(
                        login: _loginController.text,
                        password: _passwordController.text,
                      ));
                },
                color: AppColors.primaryColor,
                widget:
                    BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
                  return state.maybeMap(
                    loading: (_) => Center(
                      child: CircularProgressIndicator(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    orElse: () => Text(AppStrings.sigIn),
                  );
                }),
              )
            ],
          )),
        ),
      ),
    );
  }
}
