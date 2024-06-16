import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transportkartan/data/models/site_model.dart';
import 'package:transportkartan/data/models/workplace_model.dart';

part 'create_site_state.freezed.dart';

@freezed
abstract class CreateSiteState with _$CreateSiteState {
  const factory CreateSiteState({
    required Site site,
    required List<Workplace> workplaces,
    required bool showDuplicateWorkplaceDialog,
  }) = _CreateSiteState;
}
