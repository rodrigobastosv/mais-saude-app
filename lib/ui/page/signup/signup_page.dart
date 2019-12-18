import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:mais_saude_app/ui/page/login/login_page.dart';
import 'package:mais_saude_app/ui/page/signup/bloc/signup_bloc.dart';
import 'package:mais_saude_app/ui/page/signup/bloc/signup_state.dart';
import 'package:mais_saude_app/ui/page/signup/repository/signup_repository.dart';
import 'package:mais_saude_app/ui/widget/loading.dart';

import 'widget/signup_form.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<SignupBloc>(
        create: (_) => SignupBloc(SignupRepository()),
        child: BlocListener<SignupBloc, SignupState>(
          listener: (context, state) {
            if (state is SignupUserSuccessfulyState) {
              Get.off(LoginPage());
              GetBar(
                title: 'Usuário criado com sucesso',
                duration: Duration(seconds: 2),
              )..show();
            }
            if (state is SignupUserFailledState) {
              GetBar(
                title: 'Ocorreu uma falha',
                messageText: Text('Usuário não pôde ser criado ',
                    style: TextStyle(color: Colors.white)),
                duration: Duration(seconds: 2),
              )..show();
            }
            if (state is UserClickedLoginButtonState) {
              Get.off(LoginPage());
            }
          },
          child: BlocBuilder<SignupBloc, SignupState>(
            builder: (_, state) {
              if (state is InitialSignupState) {
                return SignupForm();
              } else if (state is SignupUserFailledState) {
                return SignupForm();
              } else {
                return Loading();
              }
            },
          ),
        ),
      ),
    );
  }
}
