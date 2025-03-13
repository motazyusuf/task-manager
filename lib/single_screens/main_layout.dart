import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_manager/core/configs/theme/app_colors.dart';
import 'package:task_manager/core/constants/strings.dart';
import 'package:task_manager/features/news/presentation/manager/news_bloc.dart';
import 'package:task_manager/features/news/presentation/pages/news_screen.dart';
import 'package:task_manager/features/tasks/presentation/manager/task_bloc.dart';
import 'package:task_manager/features/tasks/presentation/pages/tasks_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    BlocProvider(
      create: (context) => TaskBloc(),
      child: TasksScreen(),
    ),
    BlocProvider(
      create: (context) => NewsBloc(),
      child: NewsScreen(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: MyColors.primary,
        title:
            Text(_currentIndex == 0 ? MyStrings.myTaskManager : MyStrings.news),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: MyColors.complimentary,
        selectedItemColor: MyColors.primaryAccent,
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
            label: MyStrings.tasks,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article),
            label: MyStrings.news,
          ),
        ],
      ),
    );
  }
}
