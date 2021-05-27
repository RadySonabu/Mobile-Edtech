import 'package:app/core/navigator/controller.navigator.dart';
import 'package:app/features/classes/classes.dart';
import 'package:app/features/dashboard/home.dart';
import 'package:app/features/grading_system/student_grades.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonNavigator extends StatelessWidget {
  CustomButtonNavigator({Key key}) : super(key: key);

  final CustomNavigatorController controller =
      Get.put(CustomNavigatorController());

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
  var pages = [
    HomePage(),
    HandledClasses(),
    StudentGradesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => Scaffold(
            body: pages[controller.option.value],
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.red,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Classes',
                  backgroundColor: Colors.green,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'Grades',
                  backgroundColor: Colors.purple,
                ),
              ],
              currentIndex: controller.option.value,
              selectedItemColor: Colors.amber[800],
              onTap: (item) {
                controller.setPage(item);
              },
            ),
          )),
    );
  }
}
