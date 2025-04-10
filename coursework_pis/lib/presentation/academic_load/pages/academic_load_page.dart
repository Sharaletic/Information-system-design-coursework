import 'package:flutter/material.dart';

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
        title: Text('Нагрузка'),
      ),
    );
  }
}
