import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/enums/site_type.dart';

class FilterSiteCubit extends Cubit<SiteTypesState> {
  FilterSiteCubit() : super(SiteTypesState(selectedSiteTypes: <SiteType>{}));

  void toggleSiteType(SiteType siteType) {
    final selectedTypes = Set<SiteType>.from(state.selectedSiteTypes);
    if (selectedTypes.contains(siteType)) {
      selectedTypes.remove(siteType);
    } else {
      selectedTypes.add(siteType);
    }
    emit(state.copyWith(selectedSiteTypes: selectedTypes));
  }
}

class SiteTypesState {
  final Set<SiteType> selectedSiteTypes;

  SiteTypesState({required this.selectedSiteTypes});
  SiteTypesState copyWith({Set<SiteType>? selectedSiteTypes}) {
    return SiteTypesState(selectedSiteTypes: selectedSiteTypes ?? this.selectedSiteTypes);
  }
}
