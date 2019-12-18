import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mais_saude_app/core/ms_bloc_delegate.dart';

import 'ui/page/login/login_page.dart';

void main() {
  BlocSupervisor.delegate = MSBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Get.key,
      home: LoginPage(),
    );
  }
}
