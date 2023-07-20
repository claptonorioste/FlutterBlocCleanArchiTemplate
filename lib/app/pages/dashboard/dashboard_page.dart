import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture/app/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter_bloc_clean_architecture/core/injection_container.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  static const route = '/dashboard';
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      context.read<DashboardBloc>().add(GetSomeText());
                    },
                    child: const Text('Get Some Text')),
                if (state is DashboardLoading)
                  const Column(
                    children: [
                      CircularProgressIndicator(),
                      Text('Wait 2 seconds')
                    ],
                  )
                else if (state is DashboardLoaded)
                  Text(state.data)
                else if (state is DashboardError)
                  Text(state.message)
              ],
            ),
          ));
        });
  }
}
