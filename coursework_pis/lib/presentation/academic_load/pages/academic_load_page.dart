import 'package:coursework_pis/presentation/academic_load/widgets/container_academic_load_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/bottom_padding/bottom_padding.dart';
import '../../../core/routes/routes_name.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/rounded_elevated_button.dart';
import '../../person/pages/add_person_page.dart';
import '../academic_load_bloc/academic_load_bloc.dart';
import '../discipline_bloc/discipline_bloc.dart';

class AcademicLoadPage extends StatefulWidget {
  const AcademicLoadPage({super.key});

  @override
  State<AcademicLoadPage> createState() => _AcademicLoadPageState();
}

class _AcademicLoadPageState extends State<AcademicLoadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appointmentOfAcademicLoad),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            BlocBuilder<AcademicLoadBloc, AcademicLoadState>(
                builder: (context, state) {
              return state.map(
                  loading: (_) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                  loaded: (value) {
                    return ListView.separated(
                      padding: EdgeInsets.only(
                        bottom: getBottomPadding(context),
                      ),
                      itemBuilder: (context, index) {
                        return ContainerAcademicLoadListWidget(
                          academicLoad: value.academicLoads[index],
                          isReport: false,
                        );
                      },
                      separatorBuilder: (context, _) {
                        return const SizedBox(
                          height: 20.0,
                        );
                      },
                      itemCount: value.academicLoads.length,
                    );
                  },
                  failure: (value) => Text(value.message));
            }),
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: RoundedElevatedButton(
                  onPressed: () {
                    context.goNamed(
                      RoutesNames.addAcademicLoad,
                    );
                    context.read<DisciplineBloc>().add(
                          DisciplineEvent.load(),
                        );
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
