import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mais_saude_app/modules/home/home_module.dart';

import 'app_widget.dart';
import 'blocs/user_bloc.dart';
import 'pages/signin_page.dart';
import 'pages/signup_page.dart';

class AppModule extends MainModule {

  @override
  List<Bind> get binds => [
    Bind((i) => UserBloc()),
  ];

  @override
  List<Router> get routers => [
    Router("/", child: (_, args) => SigninPage()),
    Router("/signup", child: (_, args) => SignupPage()),
    Router("/home", module: HomeModule()),
  ];

  @override
  Widget get bootstrap => AppWidget();
}