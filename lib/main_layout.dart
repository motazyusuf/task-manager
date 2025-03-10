import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_manager/core/configs/theme/app_colors.dart';
import 'package:task_manager/core/constants/strings.dart';
import 'package:task_manager/features/tasks/presentation/pages/tasks_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;
  final List<Widget> _screens = [TasksScreen(), Placeholder()];
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    Hive.box(user!.uid);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primary,
        title: const Text(MyStrings.myTaskManager),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: MyColors.complimentary,
        selectedItemColor: MyColors.secondaryAccent,
        backgroundColor: MyColors.primary,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.task),
            label: "Tasks",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: "News",
          ),
        ],
      ),
    );
  }
}
