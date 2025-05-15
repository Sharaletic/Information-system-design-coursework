import 'package:coursework_pis/core/theme/app_colors.dart';
import 'package:coursework_pis/core/utils/app_strings.dart';
import 'package:coursework_pis/core/widgets/custom_text_form_field.dart';
import 'package:coursework_pis/core/widgets/rounded_elevated_button.dart';
import 'package:coursework_pis/domain/models/person.dart';
import 'package:coursework_pis/presentation/person/bloc/person_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/auxiliary_data/academic_degree.dart';
import '../../../core/auxiliary_data/post_items.dart';
import '../../../core/widgets/drop_down_button.dart';
import '../../../core/widgets/drop_down_button.dart';

class EditPersonPage extends StatefulWidget {
  const EditPersonPage({
    super.key,
    required this.person,
  });
  final Person person;

  @override
  State<EditPersonPage> createState() => _EditPersonPageState();
}

class _EditPersonPageState extends State<EditPersonPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController postDropdownValueController;
  late TextEditingController academicDegreeDropdownValueController;
  late TextEditingController _workExperienceController;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.person.fullName);
    postDropdownValueController =
        TextEditingController(text: widget.person.post!);
    academicDegreeDropdownValueController =
        TextEditingController(text: widget.person.academicDegree!);
    _workExperienceController =
        TextEditingController(text: widget.person.workExperience);
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    postDropdownValueController.dispose();
    academicDegreeDropdownValueController.dispose();
    _workExperienceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
        child: SingleChildScrollView(
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
                dropDownValue: postDropdownValueController.text,
                onChanged: (value) {
                  setState(() {
                    postDropdownValueController.text = value!;
                  });
                },
                hintText: AppStrings.discipline,
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
                dropDownValue: academicDegreeDropdownValueController.text,
                onChanged: (value) {
                  setState(() {
                    academicDegreeDropdownValueController.text = value!;
                  });
                },
                hintText: AppStrings.discipline,
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
                                PersonEvent.updatePerson(
                                  person: createPerson(),
                                ),
                              );
                        }
                      },
                      color: AppColors.primaryColor,
                      widget: Text(AppStrings.save),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Person createPerson() {
    Person person = Person(
      id: widget.person.id,
      fullName: _nameController.text,
      post: postDropdownValueController.text,
      academicDegree: academicDegreeDropdownValueController.text,
      workExperience: _workExperienceController.text,
      departmentId: widget.person.departmentId,
      role: widget.person.role,
    );
    return person;
  }
}
