import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mais_saude_app/ui/page/signup/bloc/signup_bloc.dart';
import 'package:mais_saude_app/ui/page/signup/bloc/signup_event.dart';

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  String username, password, confirmPassword;
  SignupBloc signupBloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    signupBloc = BlocProvider.of<SignupBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Usuário',
              ),
              validator: (username) =>
                  username.isEmpty ? 'Campo Obrigatóro' : null,
              onChanged: (username) => this.username = username,
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Senha',
              ),
              validator: (password) =>
                  password.isEmpty ? 'Campo Obrigatóro' : null,
              onChanged: (password) => this.password = password,
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Confirme a Senha',
              ),
              validator: (confirmPassword) {
                if (confirmPassword.isEmpty) {
                  return 'Campo Obrigatório';
                } else if (password != confirmPassword) {
                  return 'Senha e a confirmação não são idênticas';
                }
                return null;
              },
              onChanged: (confirmPassword) =>
                  this.confirmPassword = confirmPassword,
            ),
            SizedBox(height: 16),
            RaisedButton(
              onPressed: () {
                final formState = _formKey.currentState;
                if (formState.validate()) {
                  signupBloc.add(SignupButtonPressedEvent(username, password));
                }
              },
              child: Text('Criar'),
            ),
            FlatButton(
              onPressed: () => signupBloc.add(GotoLoginButtonPressedEvent()),
              child: Text('Já tem conta? Entrar!'),
            ),
          ],
        ),
      ),
    );
  }
}
