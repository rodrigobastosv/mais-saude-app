import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mais_saude_app/modules/home/blocs/home_bloc.dart';

import '../home_module.dart';

class HomePage extends StatelessWidget with InjectMixin<HomeModule> {
  @override
  Widget build(BuildContext context) {
    final bloc = get<HomeBloc>();
    print(bloc.a);
    return Container(
      color: Colors.green,
    );
  }
}
