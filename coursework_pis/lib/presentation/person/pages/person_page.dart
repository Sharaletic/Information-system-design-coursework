import 'package:coursework_pis/core/theme/app_colors.dart';
import 'package:coursework_pis/core/utils/app_strings.dart';
import 'package:coursework_pis/core/widgets/rounded_elevated_button.dart';
import 'package:coursework_pis/presentation/person/bloc/person_bloc.dart';
import 'package:coursework_pis/presentation/person/pages/add_person_page.dart';
import 'package:coursework_pis/presentation/person/widgets/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({super.key});

  @override
  State<PersonPage> createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.teacher),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            BlocBuilder<PersonBloc, PersonState>(builder: (context, state) {
              return state.map(
                  loading: (_) => Center(
                        child: CircularProgressIndicator(),
                      ),
                  loaded: (value) {
                    return ListView.separated(
                      padding: EdgeInsets.only(bottom: _getBottomPadding()),
                      itemBuilder: (BuildContext context, int index) {
                        return ContainerWidget(
                          person: value.person[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 20.0,
                        );
                      },
                      itemCount: value.person.length,
                    );
                  },
                  failure: (value) => Text(value.message));
            }),
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: RoundedElevatedButton(
                  onPressed: () {
                    showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return AddPersonPage();
                        });
                  },
                  color: AppColors.whiteColor,
                  title: AppStrings.add,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getBottomPadding() {
    final safeBottomPadding = MediaQuery.of(context).padding.bottom;
    final bottomPadding = (safeBottomPadding + 8) * 2 + 50;
    return bottomPadding;
  }
}
