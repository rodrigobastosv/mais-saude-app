import 'package:flutter_modular/flutter_modular.dart';

class UserBloc extends Disposable {
  @override
  void dispose() {
    print('Fui disposado');
  }
}