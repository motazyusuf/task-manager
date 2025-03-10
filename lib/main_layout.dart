import 'package:flutter/material.dart';
import 'package:task_manager/core/configs/theme/app_colors.dart';
import 'package:task_manager/core/constants/strings.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Center(child: Text("News Screen", style: TextStyle(fontSize: 24))),
    Center(child: Text("Tasks Screen", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
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
