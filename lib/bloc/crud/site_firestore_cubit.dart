import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/bloc/authentication/auth_cubit.dart';
import 'package:transportkartan/bloc/crud/site_repository.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/data/models/site_model.dart';
import 'package:transportkartan/data/models/state/site_firestore_state.dart';
import 'package:transportkartan/data/models/user_model.dart';

class SiteFirestoreCubit extends Cubit<SiteFirestoreState> {
  final SiteRepository repository;
  final AuthCubit _authCubit;
  SiteFirestoreCubit(this.repository, this._authCubit) : super(const SiteInitialState());

  void fetchAllSites({
    bool sortByType = false,
    List<SiteType>? siteTypes,
  }) async {
    UserModel? user = _authCubit.currentUser;
    try {
      List<Site> markerModels = await repository.fetchAllSites(
        user!.userLevel,
        siteTypes,
        sortByType,
      );

      emit(AllSites(markerModels));
    } catch (e) {
      emit(SiteFailure(e));
    }
  }

  // void fetchSites() async {
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('sites').orderBy('name').get();

  //   List<SiteMarker> markerModels = [];
  //   for (var doc in querySnapshot.docs) {
  //     final data = doc.data() as Map<String, dynamic>;

  //     SiteMarker markerModel;
  //     markerModel = SiteMarker.fromJson(data);

  //     markerModels.add(markerModel);
  //   }
  //   emit(SitesList(markerModels));
  // }

  void createSite(Site markerModel) async {
    UserModel? user = _authCubit.currentUser;

    try {
      repository.createSite(markerModel, user!.userLevel);
      emit(const SiteCreateSuccess());
      fetchAllSites();
    } catch (e) {
      emit(SiteFailure(e));
    }
  }

  void updateSite(Site markerModel) async {
    try {
      repository.updateSite(markerModel);

      emit(const SiteCreateSuccess());

      fetchAllSites();
    } catch (e) {
      emit(SiteFailure(e));
    }
  }
}
