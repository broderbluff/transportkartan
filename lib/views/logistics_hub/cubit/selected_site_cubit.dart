import 'package:flutter_bloc/flutter_bloc.dart';

class SiteListCubit extends Cubit<SiteListState> {
  SiteListCubit() : super(SiteListState(selectedIndex: -1, hoverIndex: -1));

  void setSelectedIndex(int value) {
    emit(state.copyWith(selectedIndex: value));
  }

  void setHoverIndex(int value) {
    emit(state.copyWith(hoverIndex: value));
  }

  // Add other methods to update specific boolean values
}

class SiteListState {
  final int selectedIndex;
  final int hoverIndex;
  // Add other boolean values you want to track

  SiteListState({
    required this.selectedIndex,
    required this.hoverIndex,
    // Initialize other boolean values
  });

  SiteListState copyWith({
    int? selectedIndex,
    int? hoverIndex,
    // Add other boolean values you want to track
  }) {
    return SiteListState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      hoverIndex: hoverIndex ?? this.hoverIndex,
      // Add other boolean values you want to track
    );
  }
}
