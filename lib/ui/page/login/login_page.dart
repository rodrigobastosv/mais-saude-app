import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mais_saude_app/ui/page/home_page.dart';
import 'package:mais_saude_app/ui/page/signup/signup_page.dart';
import 'package:mais_saude_app/ui/widget/loading.dart';

import 'bloc/bloc.dart';
import 'repository/login_repository.dart';
import 'widget/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(LoginRepository()),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is UserSignedSuccessfullyState) {
                Get.off(HomePage());
              }
              if (state is UserSignedFailledState) {
                GetBar(
                  title: 'Falha no login',
                  message: state.message,
                  duration: Duration(seconds: 2),
                )..show();
              }
              if (state is UserClickedSignupButtonState) {
                Get.off(SignupPage());
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (_, state) {
                if (state is InitialLoginState) {
                  return LoginForm();
                } else {
                  return Loading();
                }
              },
            ),
          )),
    );
  }
}
