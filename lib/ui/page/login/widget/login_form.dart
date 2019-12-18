import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mais_saude_app/ui/page/login/bloc/bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String username, password;
  LoginBloc loginBloc;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    loginBloc = BlocProvider.of<LoginBloc>(context);
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
              onSaved: (username) => this.username = username,
            ),
            SizedBox(height: 12),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Senha',
              ),
              validator: (password) =>
                  password.isEmpty ? 'Campo Obrigatóro' : null,
              onSaved: (password) => this.password = password,
            ),
            SizedBox(height: 16),
            RaisedButton(
              onPressed: () {
                final formState = _formKey.currentState;
                if (formState.validate()) {
                  formState.save();
                  loginBloc.add(LoginButtonPressedEvent(username, password));
                }
              },
              child: Text('LOGIN'),
            ),
            FlatButton(
              onPressed: () => loginBloc.add(GotoSignupButtonPressedEvent()),
              child: Text('Não tem conta? Criar!'),
            ),
          ],
        ),
      ),
    );
  }
}
