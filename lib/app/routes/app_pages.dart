import 'package:crudflutter/app/feature/cliente/presentation/cliente_form/controller/cliente_form_bindings.dart';
import 'package:crudflutter/app/feature/cliente/presentation/cliente_list/pages/cliente_list_page.dart';
import 'package:crudflutter/app/master/home/pages/home_page.dart';
import 'package:get/get.dart';

import '../feature/cliente/presentation/cliente_form/pages/cliente_form_page.dart';
import '../feature/cliente/presentation/cliente_list/controller/cliente_bindings.dart';
import '../master/home/controller/home_bindings.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.home,
      page: () => const ClienteListPage(),
      binding: ClienteBindings(),
    ),
    GetPage(
      name: AppRoutes.cliente,
      page: () => const HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: AppRoutes.formCliente,
      page: () => ClienteFormPage(),
      binding: ClienteFormBindings(),
      transition: Transition.fade,
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}
