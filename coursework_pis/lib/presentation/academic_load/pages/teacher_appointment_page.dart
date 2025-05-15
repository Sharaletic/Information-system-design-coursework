import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/routes_name.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/rounded_elevated_button.dart';
import '../../../domain/models/person.dart';
import '../academic_load_bloc/academic_load_bloc.dart';
import '../widgets/drop_down_button_person.dart';

class TeacherAppointmentPage extends StatefulWidget {
  const TeacherAppointmentPage({super.key, required this.academicLoadId});
  final String academicLoadId;

  @override
  State<TeacherAppointmentPage> createState() => _TeacherAppointmentPageState();
}

class _TeacherAppointmentPageState extends State<TeacherAppointmentPage> {
  final _formKey = GlobalKey<FormState>();
  final teacherController = TextEditingController();
  Person? _selectedPerson;

  @override
  void dispose() {
    teacherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.addAcademicLoad),
        leading: BackButton(
          onPressed: () {
            context.replaceNamed(RoutesNames.academicLoad);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(AppStrings.teacher),
              const SizedBox(
                height: 5,
              ),
              DropDownButtonPerson(
                  teacherController: teacherController,
                  selectedPerson: _selectedPerson,
                  onChanged: (value) {
                    setState(() {
                      _selectedPerson = value!;
                    });
                    if (value != null) {
                      teacherController.text = value.fullName;
                    }
                  }),
              const SizedBox(
                width: 30.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: RoundedElevatedButton(
                      onPressed: () {
                        context.replaceNamed(RoutesNames.academicLoad);
                      },
                      color: AppColors.primaryColor,
                      widget: const Text(AppStrings.cancellation),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: RoundedElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AcademicLoadBloc>().add(
                              AcademicLoadEvent.addParticipation(
                                  person: _selectedPerson!,
                                  academicLoadId: widget.academicLoadId));
                          context.replaceNamed(RoutesNames.academicLoad);
                        }
                      },
                      color: AppColors.primaryColor,
                      widget: const Text(AppStrings.save),
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
  //
  // AcademicLoad createAcademicLoad() => AcademicLoad(
  //     disciplineId: _selectedDiscipline!.id!,
  //     lessonType: lessonTypeController.text,
  //     quantityHours: int.parse(_quantityHoursController.text),
  //     group: _groupController.text,
  //     appointmentYear: _dateTime);
}
