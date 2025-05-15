import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/auxiliary_data/semesters.dart';
import '../../../core/bottom_padding/bottom_padding.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../../core/widgets/drop_down_button.dart';
import '../../../core/widgets/rounded_elevated_button.dart';
import '../../../domain/models/person.dart';
import '../../academic_load/widgets/container_academic_load_list_widget.dart';
import '../../academic_load/widgets/drop_down_button_person.dart';
import '../bloc/report_bloc.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final _appointmentDateController = TextEditingController();
  final _teacherController = TextEditingController();
  final _semesterController = TextEditingController();

  Person? _selectedPerson;

  @override
  void dispose() {
    _appointmentDateController.dispose();
    _teacherController.dispose();
    _semesterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.report),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    AppStrings.appointmentYear,
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              CustomTextFormField(
                controller: _appointmentDateController,
                hintText: AppStrings.appointmentYear,
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
              const Text(
                AppStrings.semester,
              ),
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
                height: 10.0,
              ),
              const Text(
                AppStrings.teacher,
              ),
              const SizedBox(
                height: 5,
              ),
              DropDownButtonPerson(
                  teacherController: _teacherController,
                  selectedPerson: _selectedPerson,
                  onChanged: (value) {
                    setState(() {
                      _selectedPerson = value!;
                    });
                    if (value != null) {
                      _teacherController.text = value.fullName;
                    }
                  }),
              const SizedBox(
                height: 30.0,
              ),
              Center(
                child: RoundedElevatedButton(
                  onPressed: () {
                    context.read<ReportBloc>().add(ReportEvent.load(
                        appointmentDate: _appointmentDateController.text,
                        semester: _semesterController.text,
                        namePerson: _selectedPerson?.fullName));
                  },
                  color: AppColors.primaryColor,
                  widget: const Text(AppStrings.generateReport),
                ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              Center(
                child: RoundedElevatedButton(
                    onPressed: () {
                      setState(() {
                        _appointmentDateController.clear();
                        _selectedPerson = null;
                        _semesterController.clear();
                      });
                    },
                    color: AppColors.primaryColor,
                    widget: const Text('Очистить')),
              ),
              const SizedBox(
                height: 15.0,
              ),
              BlocBuilder<ReportBloc, ReportState>(builder: (context, state) {
                return state.map(
                    initial: (_) => Container(),
                    loading: (_) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                    loaded: (value) {
                      return Column(
                        children: List.generate(
                          value.academicLoads.length,
                          (index) => Column(
                            children: [
                              ContainerAcademicLoadListWidget(
                                academicLoad: value.academicLoads[index],
                                isReport: true,
                              ),
                              if (index != value.academicLoads.length - 1)
                                const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      );
                    },
                    failure: (value) => Text(value.message));
              }),
            ],
          ),
        ),
      ),
    );
  }
}
