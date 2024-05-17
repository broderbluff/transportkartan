import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transportkartan/data/models/site_model.dart';
part 'site_firestore_state.freezed.dart';

@freezed
abstract class SiteFirestoreState with _$SiteFirestoreState {
  const factory SiteFirestoreState.initial() = SiteInitialState;
  const factory SiteFirestoreState.loading() = SiteLoadingState;
  const factory SiteFirestoreState.allSites(List<Site> sitesList) = AllSites;
  const factory SiteFirestoreState.createSuccess() = SiteCreateSuccess;
  const factory SiteFirestoreState.failure(dynamic error) = SiteFailure;
}
