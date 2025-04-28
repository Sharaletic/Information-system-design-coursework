import 'package:coursework_pis/core/custom_snack_bar.dart';
import 'package:coursework_pis/core/theme/app_colors.dart';
import 'package:coursework_pis/core/utils/app_strings.dart';
import 'package:coursework_pis/core/widgets/custom_text_form_field.dart';
import 'package:coursework_pis/core/widgets/rounded_elevated_button.dart';
import 'package:coursework_pis/domain/models/person.dart';
import 'package:coursework_pis/presentation/person/bloc/person_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPersonPage extends StatefulWidget {
  const AddPersonPage({super.key});

  @override
  State<AddPersonPage> createState() => _AddPersonPageState();
}

class _AddPersonPageState extends State<AddPersonPage> {
  final _nameController = TextEditingController();
  final _postController = TextEditingController();
  final _academicDegreeController = TextEditingController();
  final _workExperienceController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _postController.dispose();
    _academicDegreeController.dispose();
    _workExperienceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
          child: BlocListener<PersonBloc, PersonState>(
            listener: (context, state) {
              state.map(
                failure: (state) =>
                    CustomSnackBar.showError(context, state.message),
                loading: (_) {},
                loaded: (_) {},
              );
            },
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _nameController,
                  hintText: AppStrings.fullName,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  controller: _postController,
                  hintText: AppStrings.post,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  controller: _academicDegreeController,
                  hintText: AppStrings.academicDegree,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  controller: _workExperienceController,
                  hintText: AppStrings.workExperience,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  controller: _loginController,
                  hintText: AppStrings.login,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  controller: _passwordController,
                  hintText: AppStrings.password,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RoundedElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        color: AppColors.primaryColor,
                        widget: Text(AppStrings.cancellation),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: RoundedElevatedButton(
                        onPressed: () {
                          context.read<PersonBloc>().add(
                                PersonEvent.addPerson(
                                  person: createPerson(),
                                ),
                              );
                        },
                        color: AppColors.primaryColor,
                        widget: BlocBuilder<PersonBloc, PersonState>(
                            builder: (context, state) {
                          return state.maybeMap(
                            loading: (_) => CircularProgressIndicator(),
                            orElse: () => Text(AppStrings.save),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Person createPerson() {
    Person person = Person(
      fullName: _nameController.text,
      post: _postController.text,
      academicDegree: _academicDegreeController.text,
      workExperience: _workExperienceController.text,
      login: _loginController.text,
      password: _passwordController.text,
      status: StatusPerson.teacher,
    );
    return person;
  }
}
