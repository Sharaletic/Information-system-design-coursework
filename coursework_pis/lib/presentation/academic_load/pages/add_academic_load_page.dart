import 'package:coursework_pis/core/auxiliary_data/lesson_types.dart';
import 'package:coursework_pis/core/auxiliary_data/semesters.dart';
import 'package:coursework_pis/core/widgets/drop_down_button.dart';
import 'package:coursework_pis/domain/models/academic_load.dart';
import 'package:coursework_pis/domain/models/full_academic_load.dart';
import 'package:coursework_pis/domain/models/discipline.dart';
import 'package:coursework_pis/presentation/academic_load/academic_load_bloc/academic_load_bloc.dart';
import 'package:coursework_pis/presentation/academic_load/discipline_bloc/discipline_bloc.dart';
import 'package:coursework_pis/presentation/academic_load/widgets/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/routes/routes_name.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/date_picker.dart';
import '../../../core/widgets/drop_down_button.dart';
import '../../../core/widgets/rounded_elevated_button.dart';

class AddAcademicLoadPage extends StatefulWidget {
  const AddAcademicLoadPage({
    super.key,
  });

  @override
  State<AddAcademicLoadPage> createState() => _AddAcademicLoadPageState();
}

class _AddAcademicLoadPageState extends State<AddAcademicLoadPage> {
  final _formKey = GlobalKey<FormState>();
  final disciplineController = TextEditingController();
  final lessonTypeController = TextEditingController();
  final _quantityHoursController = TextEditingController();
  final _groupController = TextEditingController();
  final _semesterController = TextEditingController();
  Discipline? _selectedDiscipline;

  @override
  void dispose() {
    disciplineController.dispose();
    lessonTypeController.dispose();
    _quantityHoursController.dispose();
    _groupController.dispose();
    _semesterController.dispose();
    // appointmentDateController.dispose();
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
              const Text(AppStrings.discipline),
              const SizedBox(
                height: 5,
              ),
              BlocBuilder<DisciplineBloc, DisciplineState>(
                builder: (context, state) {
                  return state.maybeMap(
                      loading: (_) =>
                          Center(child: CircularProgressIndicator()),
                      loaded: (state) {
                        return DropDownButton<Discipline>(
                          items: state.disciplines
                              .map((value) => DropdownMenuItem<Discipline>(
                                    value: value,
                                    child: Text(value.disciplineTitle!,
                                        style: TextTheme.of(context).bodyLarge),
                                  ))
                              .toList(),
                          dropDownValue:
                              state.disciplines.contains(_selectedDiscipline)
                                  ? _selectedDiscipline
                                  : null,
                          onChanged: (value) {
                            setState(() {
                              _selectedDiscipline = value!;
                            });
                            if (value != null) {
                              disciplineController.text =
                                  value.disciplineTitle!;
                            }
                          },
                          hintText: AppStrings.discipline,
                        );
                      },
                      orElse: () => Container());
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(AppStrings.lessonType),
              const SizedBox(
                height: 5,
              ),
              DropDownButton<String>(
                items: LessonTypes.lessonTypeItems
                    .map((value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: TextTheme.of(context).bodyLarge),
                        ))
                    .toList(),
                dropDownValue: LessonTypes.lessonTypeItems
                        .contains(lessonTypeController.text)
                    ? lessonTypeController.text
                    : null,
                onChanged: (value) {
                  setState(() {
                    lessonTypeController.text = value!;
                  });
                },
                hintText: AppStrings.lessonType,
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(AppStrings.quantityHours),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                controller: _quantityHoursController,
                hintText: AppStrings.quantityHours,
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
              const Text(AppStrings.group),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                controller: _groupController,
                hintText: AppStrings.group,
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
              const Text(AppStrings.appointmentYear),
              const SizedBox(
                height: 5,
              ),
              DropDownButton<String>(
                items: Semesters.semesters
                    .map((value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: TextTheme.of(context).bodyLarge),
                        ))
                    .toList(),
                dropDownValue:
                    Semesters.semesters.contains(_semesterController.text)
                        ? _semesterController.text
                        : null,
                onChanged: (value) {
                  setState(() {
                    _semesterController.text = value!;
                  });
                },
                hintText: AppStrings.semester,
              ),
              const SizedBox(
                height: 40.0,
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
                              AcademicLoadEvent.addAcademicLoad(
                                  academicLoad: createAcademicLoad()));
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

  AcademicLoad createAcademicLoad() => AcademicLoad(
        disciplineId: _selectedDiscipline!.id!,
        lessonType: lessonTypeController.text,
        quantityHours: int.parse(_quantityHoursController.text),
        group: _groupController.text,
        appointmentYear: DateTime.now().year,
        semester: int.parse(_semesterController.text),
      );
}
