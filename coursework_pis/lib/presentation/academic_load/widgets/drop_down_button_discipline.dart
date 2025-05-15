import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/drop_down_button.dart';
import '../../../domain/models/discipline.dart';
import '../discipline_bloc/discipline_bloc.dart';

class DropDownButtonDiscipline extends StatefulWidget {
  const DropDownButtonDiscipline(
      {super.key,
      required this.disciplineController,
      required Discipline? selectedDiscipline,
      required this.onChanged})
      : _selectedDiscipline = selectedDiscipline;
  final TextEditingController disciplineController;
  final Discipline? _selectedDiscipline;
  final Function(Discipline?) onChanged;

  @override
  State<DropDownButtonDiscipline> createState() =>
      _DropDownButtonDisciplineState();
}

class _DropDownButtonDisciplineState extends State<DropDownButtonDiscipline> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DisciplineBloc, DisciplineState>(
      builder: (context, state) {
        return state.maybeMap(
            loading: (_) => Center(child: CircularProgressIndicator()),
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
                    state.disciplines.contains(widget._selectedDiscipline)
                        ? widget._selectedDiscipline
                        : null,
                onChanged: widget.onChanged,
                hintText: AppStrings.discipline,
              );
            },
            orElse: () => Container());
      },
    );
  }
}
