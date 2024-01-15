import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/views/site_and_company_view/cubit/test/test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(const TestState(isLoading: true));

  Future<void> loadInitialData() async {
    final stableState = state;
    try {
      emit(state.copyWith(isLoading: true));

      // TODO your code here

      emit(state.copyWith(isLoading: false));
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
      emit(stableState.copyWith(isLoading: false));
    }
  }
}
