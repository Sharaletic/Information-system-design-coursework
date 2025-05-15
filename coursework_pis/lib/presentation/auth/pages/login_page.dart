import 'package:coursework_pis/core/routes/routes_name.dart';
import 'package:coursework_pis/core/theme/app_colors.dart';
import 'package:coursework_pis/core/utils/app_strings.dart';
import 'package:coursework_pis/core/widgets/custom_text_form_field.dart';
import 'package:coursework_pis/core/widgets/rounded_elevated_button.dart';
import 'package:coursework_pis/presentation/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/custom_snackbar.dart';
import '../../../domain/models/person.dart';

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
              success: (value) {
                clear();
                if (value.person.role == RolePerson.headOfDepartment) {
                  context.goNamed(RoutesNames.teacher);
                }
                if (value.person.role == RolePerson.teacher) {
                  context.goNamed(RoutesNames.teacherAcademicLoad);
                }
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextFormField(
                controller: _loginController,
                labelText: AppStrings.login,
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
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                controller: _passwordController,
                labelText: AppStrings.password,
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
              const SizedBox(
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
                    loading: (_) => const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    orElse: () => const Text(AppStrings.sigIn),
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
