import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/drop_down_button.dart';
import '../../../domain/models/person.dart';
import '../../person/bloc/person_bloc.dart';

class DropDownButtonPerson extends StatefulWidget {
  const DropDownButtonPerson(
      {super.key,
      required this.teacherController,
      required Person? selectedPerson,
      required this.onChanged})
      : _selectedPerson = selectedPerson;
  final TextEditingController teacherController;
  final Person? _selectedPerson;
  final Function(Person?) onChanged;

  @override
  State<DropDownButtonPerson> createState() => _DropDownButtonPersonState();
}

class _DropDownButtonPersonState extends State<DropDownButtonPerson> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonBloc, PersonState>(builder: (context, state) {
      return state.map(
          loading: (_) => const Center(
                child: CircularProgressIndicator(),
              ),
          loaded: (state) => DropDownButton<Person>(
                items: state.person
                    .map((value) => DropdownMenuItem<Person>(
                        value: value,
                        child: Text(value.fullName,
                            style: TextTheme.of(context).bodyLarge)))
                    .toList(),
                dropDownValue: state.person.contains(widget._selectedPerson)
                    ? widget._selectedPerson
                    : null,
                onChanged: widget.onChanged,
                hintText: AppStrings.teacher,
              ),
          failure: (_) => Container());
    });
  }
}
