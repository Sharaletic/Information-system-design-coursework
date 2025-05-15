import 'package:coursework_pis/core/auxiliary_data/academic_degree.dart';
import 'package:coursework_pis/core/theme/app_colors.dart';
import 'package:coursework_pis/core/utils/app_strings.dart';
import 'package:coursework_pis/core/widgets/custom_text_form_field.dart';
import 'package:coursework_pis/core/widgets/drop_down_button.dart';
import 'package:coursework_pis/core/widgets/rounded_elevated_button.dart';
import 'package:coursework_pis/domain/models/person.dart';
import 'package:coursework_pis/presentation/person/bloc/person_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/auxiliary_data/post_items.dart';
import '../../../core/widgets/custom_snackbar.dart';

class AddPersonPage extends StatefulWidget {
  const AddPersonPage({super.key});

  @override
  State<AddPersonPage> createState() => _AddPersonPageState();
}

class _AddPersonPageState extends State<AddPersonPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _postController = TextEditingController();
  final _academicDegreeController = TextEditingController();
  final _workExperienceController = TextEditingController();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  String? postDropdownValue;
  String? academicDegreeDropdownValue;

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
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 30.0,
          ),
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
                  labelText: AppStrings.fullName,
                  hintText: AppStrings.fullName,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.required;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
                DropDownButton<String>(
                  items: PostItems.postItems
                      .map((value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: TextTheme.of(context).bodyLarge),
                          ))
                      .toList(),
                  dropDownValue: PostItems.postItems.contains(postDropdownValue)
                      ? postDropdownValue
                      : null,
                  onChanged: (value) {
                    setState(() {
                      postDropdownValue = value!;
                    });
                  },
                  hintText: AppStrings.post,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                DropDownButton<String>(
                  items: AcademicDegree.academicDegreeItems
                      .map((value) => DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,
                                style: TextTheme.of(context).bodyLarge),
                          ))
                      .toList(),
                  dropDownValue: AcademicDegree.academicDegreeItems
                          .contains(academicDegreeDropdownValue)
                      ? academicDegreeDropdownValue
                      : null,
                  onChanged: (value) {
                    setState(() {
                      academicDegreeDropdownValue = value!;
                    });
                  },
                  hintText: AppStrings.academicDegree,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                CustomTextFormField(
                  controller: _workExperienceController,
                  labelText: AppStrings.workExperience,
                  hintText: AppStrings.workExperience,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.required;
                    }
                    if (int.tryParse(value) == null) {
                      return AppStrings.wrongType;
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10.0,
                ),
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
                ),
                const SizedBox(
                  height: 10.0,
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
                          if (_formKey.currentState!.validate()) {
                            context.read<PersonBloc>().add(
                                  PersonEvent.addPerson(
                                    person: createPerson(),
                                  ),
                                );
                          }
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
      post: postDropdownValue,
      academicDegree: academicDegreeDropdownValue,
      workExperience: _workExperienceController.text,
      login: _loginController.text,
      password: _passwordController.text,
      role: RolePerson.teacher,
    );
    return person;
  }
}
