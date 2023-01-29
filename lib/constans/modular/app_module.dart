import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon_api/controllers/poke_controller.dart';
import 'package:pokemon_api/views/details_page.dart';
import 'package:pokemon_api/views/splash_page.dart';

import '../../views/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [Bind.factory<PokeController>((i) => (i()))];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: ((context, args) => const SplashPage())),
        ChildRoute('/home', child: ((context, args) => const HomePage())),
        ChildRoute(
          '/details',
          child: ((context, args) => DetailsPage(
                id: args.data['id'].toString(),
              )),
        )
      ];
}
