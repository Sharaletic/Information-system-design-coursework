import 'package:coursework_pis/core/theme/app_colors.dart';
import 'package:coursework_pis/core/utils/app_strings.dart';
import 'package:coursework_pis/core/widgets/rounded_elevated_button.dart';
import 'package:coursework_pis/domain/models/person.dart';
import 'package:coursework_pis/presentation/person/bloc/person_bloc.dart';
import 'package:coursework_pis/presentation/person/pages/edit_person_page.dart';
import 'package:coursework_pis/presentation/person/widgets/rich_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContainerPersonListWidget extends StatelessWidget {
  const ContainerPersonListWidget({
    super.key,
    required this.person,
    required this.index,
  });
  final Person person;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsetsDirectional.only(start: 20, top: 16, end: 20, bottom: 8),
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
          if (index == 0) Text(AppStrings.headOfDepartment),
          RichTextWidget(
              title: AppStrings.fullName, definition: person.fullName),
          RichTextWidget(title: AppStrings.post, definition: person.post!),
          RichTextWidget(
              title: AppStrings.academicDegree,
              definition: person.academicDegree!),
          RichTextWidget(
              title: AppStrings.workExperience,
              definition: person.workExperience!),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              Expanded(
                child: RoundedElevatedButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return EditPersonPage(
                            person: person,
                          );
                        });
                  },
                  color: Colors.white,
                  widget: Text(AppStrings.edit),
                ),
              ),
              if (index != 0)
                SizedBox(
                  width: 5,
                ),
              if (index != 0)
                Expanded(
                  child: RoundedElevatedButton(
                    onPressed: () {
                      context.read<PersonBloc>().add(
                            PersonEvent.deletePerson(id: person.id!),
                          );
                    },
                    color: Colors.white,
                    widget: Text(AppStrings.delete),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
