import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:mais_saude_app/ui/page/signup/repository/signup_repository.dart';

import './bloc.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(this.signupRepository);

  final SignupRepository signupRepository;

  @override
  SignupState get initialState => InitialSignupState();

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is SignupButtonPressedEvent) {
      yield LoadingState();

      final signupSuccess =
          await signupRepository.signupUser(event.username, event.password);

      if (signupSuccess) {
        yield SignupUserSuccessfulyState();
      } else {
        yield SignupUserFailledState();
      }
    }
    if (event is GotoLoginButtonPressedEvent) {
      yield UserClickedLoginButtonState();
    }
  }
}
