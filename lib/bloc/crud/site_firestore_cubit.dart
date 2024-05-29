import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/bloc/authentication/auth_cubit.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/data/models/site_model.dart';
import 'package:transportkartan/data/models/state/site_firestore_state.dart';
import 'package:transportkartan/data/models/user_model.dart';

class SiteFirestoreCubit extends Cubit<SiteFirestoreState> {
  final AuthCubit _authCubit;
  SiteFirestoreCubit(this._authCubit) : super(const SiteInitialState());

  void fetchAllSites({
    bool sortByType = false,
    List<SiteType>? siteTypes,
  }) async {
    UserModel? user = _authCubit.currentUser;
    try {
      Query query = FirebaseFirestore.instance.collection('sites');
      if (user!.userLevel == 1 || user.userLevel == 3) {
        query = query.where('isITF', isEqualTo: true);
      }
      if (sortByType && siteTypes != null && siteTypes.isNotEmpty) {
        query = query.where('type', whereIn: siteTypes.map((type) => type.returnLast()).toList());
      }

      query = query.orderBy('name');

      QuerySnapshot querySnapshot = await query.get();

      List<Site> markerModels = [];
      for (var doc in querySnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;

        Site markerModel;
        markerModel = Site.fromJson(data);

        markerModels.add(markerModel);
      }
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

    if (user!.userLevel == 1) {
      markerModel = markerModel.copyWith(isITF: true);
    }
    try {
      await FirebaseFirestore.instance
          .collection('sites')
          .doc(markerModel.id) // Set documentId to SiteMarker.id
          .set(markerModel.toJson());

      emit(const SiteCreateSuccess());
      fetchAllSites();
    } catch (e) {
      emit(SiteFailure(e));
    }
  }

  void updateSite(Site markerModel) async {
    try {
      await FirebaseFirestore.instance
          .collection('sites')
          .doc(markerModel.id) // Use SiteMarker.id as documentId
          .update(markerModel.toJson());

      emit(const SiteCreateSuccess());

      fetchAllSites();
    } catch (e) {
      emit(SiteFailure(e));
    }
  }
}
