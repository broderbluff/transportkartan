import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transportkartan/data/models/workplace_model.dart';
part 'workplace_firestore_state.freezed.dart';

@freezed
abstract class WorkplaceFirestoreState with _$WorkplaceFirestoreState {
  const factory WorkplaceFirestoreState.initial() = InitialState;
  const factory WorkplaceFirestoreState.loading() = LoadingState;
  const factory WorkplaceFirestoreState.allWorkplaces(List<Workplace> workplaceList) = AllWorkplaces;
  const factory WorkplaceFirestoreState.createSuccess() = CreateSuccess;
  const factory WorkplaceFirestoreState.failure(dynamic error) = Failure;
}
