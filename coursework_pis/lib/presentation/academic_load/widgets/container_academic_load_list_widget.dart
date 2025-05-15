import 'package:coursework_pis/domain/models/full_academic_load.dart';
import 'package:coursework_pis/presentation/academic_load/discipline_bloc/discipline_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/routes/routes_name.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/rounded_elevated_button.dart';
import '../../person/widgets/rich_text_widget.dart';
import '../academic_load_bloc/academic_load_bloc.dart';

class ContainerAcademicLoadListWidget extends StatelessWidget {
  const ContainerAcademicLoadListWidget({
    super.key,
    required this.academicLoad,
    required this.isReport,
  });
  final FullAcademicLoad academicLoad;
  final bool isReport;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.only(
        start: 20,
        top: 16,
        end: 20,
        bottom: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: Color(0x20000000),
            offset: Offset(
              0.0,
              1,
            ),
          )
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichTextWidget(
              title: AppStrings.discipline,
              definition: academicLoad.discipline.disciplineTitle!),
          RichTextWidget(
              title: AppStrings.lessonType,
              definition: academicLoad.lessonType),
          RichTextWidget(
              title: AppStrings.quantityHours,
              definition: academicLoad.quantityHours.toString()),
          RichTextWidget(
              title: AppStrings.group, definition: academicLoad.group),
          RichTextWidget(
              title: AppStrings.appointmentYear,
              definition: academicLoad.appointmentYear.toString()),
          RichTextWidget(
              title: AppStrings.semester,
              definition: academicLoad.semester.toString()),
          if (academicLoad.person != null)
            RichTextWidget(
                title: AppStrings.teacher,
                definition: academicLoad.person!.fullName),
          const SizedBox(
            height: 10.0,
          ),
          if (!isReport)
            Row(
              children: [
                Expanded(
                  child: RoundedElevatedButton(
                    onPressed: () {
                      context.goNamed(RoutesNames.editAcademicLoad,
                          extra: academicLoad);
                      context.read<DisciplineBloc>().add(
                            DisciplineEvent.load(),
                          );
                    },
                    color: Colors.white,
                    widget: Text(AppStrings.edit),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: RoundedElevatedButton(
                    onPressed: () {
                      context.read<AcademicLoadBloc>().add(
                            AcademicLoadEvent.deleteAcademicLoad(
                              id: academicLoad.id,
                            ),
                          );
                    },
                    color: Colors.white,
                    widget: const Text(AppStrings.delete),
                  ),
                ),
              ],
            ),
          if (academicLoad.person == null && !isReport)
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: RoundedElevatedButton(
                onPressed: () {
                  context.goNamed(RoutesNames.teacherAppointment,
                      pathParameters: {'academicLoadId': academicLoad.id});
                },
                color: Colors.white,
                widget: const Text(AppStrings.appointTeacher),
              ),
            ),
        ],
      ),
    );
  }
}
