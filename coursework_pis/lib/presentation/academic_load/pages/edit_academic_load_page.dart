import 'package:coursework_pis/core/auxiliary_data/lesson_types.dart';
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
import '../../../core/widgets/drop_down_button.dart';
import '../../../core/widgets/rounded_elevated_button.dart';

class EditAcademicLoadPage extends StatefulWidget {
  const EditAcademicLoadPage({
    super.key,
    required this.academicLoad,
  });
  final FullAcademicLoad academicLoad;

  @override
  State<EditAcademicLoadPage> createState() => _EditAcademicLoadPageState();
}

class _EditAcademicLoadPageState extends State<EditAcademicLoadPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController disciplineController;
  late TextEditingController lessonTypeController;
  late TextEditingController _quantityHoursController;
  late TextEditingController _groupController;
  late TextEditingController appointmentDateController;
  DateTime _dateTime = DateTime.now();
  late Discipline _selectedDiscipline;

  List<Discipline> disciplines = [];
  DateTime selectedDay = DateTime.now();

  @override
  void initState() {
    disciplineController = TextEditingController(
        text: widget.academicLoad.discipline.disciplineTitle);
    lessonTypeController =
        TextEditingController(text: widget.academicLoad.lessonType);
    _quantityHoursController = TextEditingController(
        text: widget.academicLoad.quantityHours.toString());
    _groupController = TextEditingController(text: widget.academicLoad.group);
    appointmentDateController = TextEditingController(
      text: DateFormat.yMd('RU-ru').format(widget.academicLoad.appointmentYear),
    );
    _selectedDiscipline = widget.academicLoad.discipline;
    super.initState();
  }

  @override
  void dispose() {
    disciplineController.dispose();
    lessonTypeController.dispose();
    _quantityHoursController.dispose();
    _groupController.dispose();
    appointmentDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Редактирование нагрузки'),
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
                dropDownValue: lessonTypeController.text,
                onChanged: (value) {
                  setState(() {
                    lessonTypeController.text = value!;
                  });
                },
                hintText: AppStrings.discipline,
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
              const Text(AppStrings.appointmentYear),
              const SizedBox(
                height: 5,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  CustomTextFormField(
                    readOnly: true,
                    controller: appointmentDateController,
                    hintText: AppStrings.appointmentYear,
                    // validator: _validateAge,
                  ),
                  Positioned.fill(
                    child: MyDatePicker(
                      currentDate: DateFormat('dd.MM.yyyy')
                          .parse(appointmentDateController.text),
                      changeDate: (value) {
                        setState(() {
                          _dateTime = value;
                          appointmentDateController.text =
                              DateFormat.yMd('RU-ru').format(_dateTime);
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: RoundedElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
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
                              AcademicLoadEvent.updateAcademicLoad(
                                  academicLoad: createAcademicLoad()));
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
      id: widget.academicLoad.id,
      disciplineId: _selectedDiscipline.id!,
      lessonType: lessonTypeController.text,
      quantityHours: int.parse(_quantityHoursController.text),
      group: _groupController.text,
      appointmentYear: _dateTime);
}
