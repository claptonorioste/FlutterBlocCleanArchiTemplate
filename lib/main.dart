import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture/app/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_bloc_clean_architecture/core/injection_container.dart'
    as gi;
import 'app/pages/dashboard/dashboard_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await gi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<DashboardBloc>(
        create: (_) => gi.serviceLocator<DashboardBloc>(),
      ),
    ], child: const MaterialApp(home: DashboardPage()));
  }
}
