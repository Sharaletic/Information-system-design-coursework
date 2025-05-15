import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/bottom_padding/bottom_padding.dart';
import '../../../core/utils/app_strings.dart';
import '../../academic_load/widgets/container_academic_load_list_widget.dart';
import '../bloc/teacher_academic_load_bloc.dart';

class TeacherAcademicLoadPage extends StatefulWidget {
  const TeacherAcademicLoadPage({super.key});

  @override
  State<TeacherAcademicLoadPage> createState() =>
      _TeacherAcademicLoadPageState();
}

class _TeacherAcademicLoadPageState extends State<TeacherAcademicLoadPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.myAcademicLoad),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          children: [
            BlocBuilder<TeacherAcademicLoadBloc, TeacherAcademicLoadState>(
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
                          isReport: true,
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
          ],
        ),
      ),
    );
  }
}
