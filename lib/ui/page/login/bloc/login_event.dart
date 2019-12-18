import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressedEvent extends LoginEvent {
  const LoginButtonPressedEvent(this.username, this.password);

  final String username;
  final String password;

  @override
  List<Object> get props => [username, password];
}

class GotoSignupButtonPressedEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}
