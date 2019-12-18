import 'package:equatable/equatable.dart';

abstract class SignupState extends Equatable {
  const SignupState();
}

class InitialSignupState extends SignupState {
  @override
  List<Object> get props => [];
}

class LoadingState extends SignupState {
  @override
  List<Object> get props => [];
}

class SignupUserSuccessfulyState extends SignupState {
  @override
  List<Object> get props => [];
}

class SignupUserFailledState extends SignupState {
  @override
  List<Object> get props => [];
}

class UserClickedLoginButtonState extends SignupState {
  @override
  List<Object> get props => [];
}
