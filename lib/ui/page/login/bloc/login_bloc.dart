import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mais_saude_app/ui/page/login/repository/login_repository.dart';

import 'bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.loginRepository);

  final LoginRepository loginRepository;

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressedEvent) {
      yield LoadingState();

      final loginSuccess =
          await loginRepository.signUser(event.username, event.password);

      if (loginSuccess) {
        yield UserSignedSuccessfullyState();
      } else {
        yield UserSignedFailledState('Usuário ou senha inválidos');
      }
    } else if (event is GotoSignupButtonPressedEvent) {
      yield UserClickedSignupButtonState();
    }
  }
}
