import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_clean_architecture/app/pages/dashboard/bloc/dashboard_bloc.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  static const route = '/dashboard';
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(),
      child: BlocConsumer<DashboardBloc, DashboardState>(
          listener: (context, state) {
        if (state.status == Status.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.errorMessage ?? 'An error occurred'),
            ),
          );
        }
      }, builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                state.isLoading
                    ? const CircularProgressIndicator()
                    : Text((state.someText?.isEmpty ?? true)
                        ? 'Tap the button to get some text'
                        : state.someText ?? ''),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    context
                        .read<DashboardBloc>()
                        .add(const DashboardEvent.getSomeText());
                  },
                  child: const Text('Get Data'),
                ),
                MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    context.read<DashboardBloc>().add(
                        const DashboardEvent.getSomeText(triggerError: true));
                  },
                  child: const Text('Trigger Error'),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
