import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class InitialLoginState extends LoginState {
  @override
  List<Object> get props => [];
}

class LoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class UserClickedSignupButtonState extends LoginState {
  @override
  List<Object> get props => [];
}

class UserSignedSuccessfullyState extends LoginState {
  @override
  List<Object> get props => [];
}

class UserSignedFailledState extends LoginState {
  const UserSignedFailledState(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
