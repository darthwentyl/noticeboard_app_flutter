import 'package:flutter/material.dart';
import 'package:noticeboard/const/app_theme.dart';
import 'package:noticeboard/pages/login_page.dart';

void main() {
  runApp(const NoticeBoardApp());
}

class NoticeBoardApp extends StatelessWidget {
  const NoticeBoardApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.build(context),
      home: const LoginPage(),
    );
  }
}
