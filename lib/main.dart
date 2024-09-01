import 'package:flutter/material.dart';
import 'package:flutter_bloc_clean_architecture/core/autoroutes/routes.dart';
import 'package:flutter_bloc_clean_architecture/core/injection_container.dart'
    as gi;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await gi.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AppRouter _appRouter;
  MyApp({super.key}) : _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
