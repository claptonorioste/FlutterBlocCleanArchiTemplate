import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc_clean_architecture/core/autoroutes/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DashboardRoute.page, initial: true),
      ];
}
