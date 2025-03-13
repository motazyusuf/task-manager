import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_manager/core/services/notification.dart';
import 'package:task_manager/features/tasks/data/repositories/task_type_adapter.dart';

import '../../features/tasks/data/models/task_model.dart';
import '../../features/tasks/presentation/widgets/add_task_bottom_sheet.dart';
import '../../features/tasks/presentation/widgets/update_task_botom_sheet.dart';
import '../../firebase_options.dart';
import '../configs/theme/app_colors.dart';
import 'bloc_observer.dart';

abstract class MyFunctions {
  static void showSuccessSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.white), // Check icon
          SizedBox(width: 10.w),
          Expanded(
              child:
                  Text(message, style: const TextStyle(color: Colors.white))),
        ],
      ),
      backgroundColor: Colors.green,
      // Green background
      behavior: SnackBarBehavior.floating,
      // Floating style
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      margin: const EdgeInsets.all(16),
      // Margin from edges
      duration: const Duration(seconds: 5), // Duration of snackbar
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void showFailSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          const Icon(Icons.error, color: Colors.white), // Check icon
          SizedBox(width: 10.w),
          Expanded(child: Text(message, style: TextStyle(color: Colors.white))),
        ],
      ),
      backgroundColor: Colors.red,
      // Green background
      behavior: SnackBarBehavior.floating,
      // Floating style
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      margin: const EdgeInsets.all(16),
      // Margin from edges
      duration: const Duration(seconds: 5), // Duration of snackbar
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    } else if (!RegExp(r'^\d{6,}$').hasMatch(value)) {
      return 'Password must be 6 digits or more';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? signInValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    }

    return null;
  }

  static String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    }
    return null;
  }

  static String getSignInErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        return 'Invalid Email.';
      case 'invalid-credential':
        return 'Wrong Email or Password';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }

  static String passwordResetErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'invalid-email':
        return 'Invalid Email.';
      case 'invalid-credential':
        return 'Wrong Email or Password';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }

  static String getSignUpErrorMessage(String errorCode) {
    switch (errorCode) {
      case 'email-already-in-use':
        return 'This email address is already in use by another account.';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }

  static void showLoading(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false, // Prevents dismissing
        builder: (context) => const Center(
                child: CircularProgressIndicator(
              color: MyColors.primary,
            )));
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static appSetup() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    await FirebaseApi().fcmNotifications();
    Hive.registerAdapter(TaskTypeAdapter());
    Bloc.observer = MyBlocObserver();
    await Hive.openBox('settings');
    await Hive.openBox<TaskModel>("User");
  }

  @pragma('vm:entry-point')
  static Future<void> backgroundHandler(RemoteMessage message) async {
    Firebase.initializeApp();
    if (message.data.isNotEmpty) {
      final data = message.data;
      FlutterLocalNotificationsPlugin().show(
        message.messageId.hashCode,
        data['title'],
        data['body'],
        const NotificationDetails(
          android: AndroidNotificationDetails('taskManager', 'channelName',
              importance: Importance.max,
              priority: Priority.high,
              icon: '@mipmap/ic_launcher'),
          iOS: DarwinNotificationDetails(),
        ),
      );
    }
  }

  static void showAddTaskBottomSheet(BuildContext parentContext) {
    showModalBottomSheet(
      context: parentContext,
      isScrollControlled: true, // Makes sheet full height
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return AddTaskBottomSheet(parentContext: parentContext);
      },
    );
  }

  static void showEditTaskBottomSheet(BuildContext parentContext,
      TaskModel task) {
    showModalBottomSheet(
      context: parentContext,
      isScrollControlled: true, // Makes sheet full height
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return UpdateTaskBottomSheet(parentContext: parentContext, task: task);
      },
    );
  }

}
