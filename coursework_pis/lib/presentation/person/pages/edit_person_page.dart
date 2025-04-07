import 'package:coursework_pis/core/theme/app_colors.dart';
import 'package:coursework_pis/core/utils/app_strings.dart';
import 'package:coursework_pis/core/widgets/custom_text_form_field.dart';
import 'package:coursework_pis/core/widgets/rounded_elevated_button.dart';
import 'package:coursework_pis/domain/models/person.dart';
import 'package:coursework_pis/presentation/person/bloc/person_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  late TextEditingController _nameController;
  late TextEditingController _postController;
  late TextEditingController _academicDegreeController;
  late TextEditingController _workExperienceController;

  @override
  void initState() {
    _nameController = TextEditingController(text: widget.person.fullName);
    _postController = TextEditingController(text: widget.person.post);
    _academicDegreeController =
        TextEditingController(text: widget.person.academicDegree);
    _workExperienceController =
        TextEditingController(text: widget.person.workExperience);
    super.initState();
  }

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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
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
                    title: AppStrings.cancellation,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: RoundedElevatedButton(
                    onPressed: () {
                      context.read<PersonBloc>().add(
                            PersonEvent.updatePerson(
                              person: createPerson(),
                            ),
                          );
                    },
                    color: AppColors.primaryColor,
                    title: AppStrings.save,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Person createPerson() {
    Person person = Person(
      id: widget.person.id,
      fullName: _nameController.text,
      post: _postController.text,
      academicDegree: _academicDegreeController.text,
      workExperience: _workExperienceController.text,
      idDepartment: widget.person.idDepartment,
      status: widget.person.status,
    );
    return person;
  }
}
