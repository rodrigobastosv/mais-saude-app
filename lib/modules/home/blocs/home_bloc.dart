import 'package:flutter_modular/flutter_modular.dart';

class HomeBloc extends Disposable {
  int a;

  HomeBloc() {
    a = 5;
  }

  @override
  void dispose() {
    print('HomeBloc foi disposado');
  }
}