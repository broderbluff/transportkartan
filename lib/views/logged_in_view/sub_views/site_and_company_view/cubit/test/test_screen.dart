import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/cubit/test/test_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/site_and_company_view/cubit/test/test_state.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final screenCubit = TestCubit();

  @override
  void initState() {
    screenCubit.loadInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TestCubit, TestState>(
        bloc: screenCubit,
        listener: (BuildContext context, TestState state) {
          if (state.error != null) {
            // TODO your code here
          }
        },
        builder: (BuildContext context, TestState state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return buildBody(state);
        },
      ),
    );
  }

  Widget buildBody(TestState state) {
    return ListView(
      children: const [
        // TODO your code here
      ],
    );
  }
}
