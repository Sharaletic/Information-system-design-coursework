import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';

class ScaffoldWithNavbar extends StatefulWidget {
  const ScaffoldWithNavbar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<ScaffoldWithNavbar> createState() => _ScaffoldWithNavbarState();
}

class _ScaffoldWithNavbarState extends State<ScaffoldWithNavbar> {
  List<String> listOfStrings = [
    'Главная',
    'Нагрузка',
    'Отчет',
    'Профиль',
  ];

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.design_services,
    Icons.list_alt_sharp,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Container(
              height: 64,
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColors.backGroundColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.backGroundColor.withOpacity(0.3),
                    offset: Offset(0, 20),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: ListView.builder(
                itemCount: listOfStrings.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => _onItemTapped(context, index),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: index == widget.navigationShell.currentIndex
                            ? displayWidth * .30
                            : displayWidth * .18,
                        alignment: Alignment.center,
                        child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn,
                          height: index == widget.navigationShell.currentIndex
                              ? displayWidth * .12
                              : 0,
                          width: index == widget.navigationShell.currentIndex
                              ? displayWidth * .30
                              : 0,
                          decoration: BoxDecoration(
                            color: index == widget.navigationShell.currentIndex
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      AnimatedContainer(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                        width: index == widget.navigationShell.currentIndex
                            ? displayWidth * .31
                            : displayWidth * .18,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width: index ==
                                          widget.navigationShell.currentIndex
                                      ? displayWidth * .11
                                      : 0,
                                ),
                                AnimatedOpacity(
                                  opacity: index ==
                                          widget.navigationShell.currentIndex
                                      ? 1
                                      : 0,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  child: Text(
                                    index == widget.navigationShell.currentIndex
                                        ? listOfStrings[index]
                                        : '',
                                    style: TextStyle(
                                      color: AppColors.backGroundColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  width: index ==
                                          widget.navigationShell.currentIndex
                                      ? displayWidth * .03
                                      : 20,
                                ),
                                Icon(
                                  listOfIcons[index],
                                  size: displayWidth * .056,
                                  color: index ==
                                          widget.navigationShell.currentIndex
                                      ? AppColors.backGroundColor
                                      : AppColors.primaryColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }
}
