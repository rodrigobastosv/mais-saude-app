import 'package:flutter_modular/flutter_modular.dart';
import 'package:mais_saude_app/modules/home/blocs/home_bloc.dart';

import 'pages/home_page.dart';

class HomeModule extends ChildModule {

  @override
  List<Bind> get binds => [
    Bind((i) => HomeBloc()),
  ];

  @override
  List<Router> get routers => [
    Router("/home", child: (_, args) => HomePage()),
  ];
}