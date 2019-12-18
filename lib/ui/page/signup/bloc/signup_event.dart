import 'package:equatable/equatable.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class SignupButtonPressedEvent extends SignupEvent {
  const SignupButtonPressedEvent(this.username, this.password);

  final String username;
  final String password;

  @override
  List<Object> get props => [username, password];
}

class GotoLoginButtonPressedEvent extends SignupEvent {
  @override
  List<Object> get props => [];
}
