import 'package:coursework_pis/core/theme/app_colors.dart';
import 'package:coursework_pis/core/utils/app_strings.dart';
import 'package:coursework_pis/core/widgets/rounded_elevated_button.dart';
import 'package:coursework_pis/presentation/person/bloc/person_bloc.dart';
import 'package:coursework_pis/presentation/person/pages/add_person_page.dart';
import 'package:coursework_pis/presentation/person/widgets/container_person_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/bottom_padding/bottom_padding.dart';

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
        title: const Text(AppStrings.teachers),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            BlocBuilder<PersonBloc, PersonState>(builder: (context, state) {
              return state.map(
                  loading: (_) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  loaded: (value) {
                    return ListView.separated(
                      padding:
                          EdgeInsets.only(bottom: getBottomPadding(context)),
                      itemBuilder: (context, index) {
                        return ContainerPersonListWidget(
                          person: value.person[index],
                          index: index,
                        );
                      },
                      separatorBuilder: (context, _) {
                        return const SizedBox(
                          height: 20.0,
                        );
                      },
                      itemCount: value.person.length,
                    );
                  },
                  failure: (_) => Container());
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
                  widget: const Text(AppStrings.add),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
