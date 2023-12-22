import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/models/site_model.dart';

class SitesFirestoreCubit extends Cubit<SitesFirestoreState> {
  SitesFirestoreCubit() : super(SitesInitial());

  void fetchSites() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('sites').get();

    List<SiteMarker> markerModels = [];
    for (var doc in querySnapshot.docs) {
      print(doc.id);
      SiteMarker markerModel;
      markerModel = SiteMarker.fromSnapshot(doc);

      markerModels.add(markerModel);
    }
    emit(SitesList(markerModels));
  }

  void createSite(SiteMarker markerModel) async {
    try {
      await FirebaseFirestore.instance
          .collection('sites')
          .doc(markerModel.id) // Set documentId to SiteMarker.id
          .set(markerModel.toMap());

      emit(CreateSuccess());
      emit(SitesInitial());
    } catch (e) {
      emit(CreateFailure(e));
    }
  }
}

class CreateFailure extends SitesFirestoreState {
  final dynamic error;

  CreateFailure(this.error);

  @override
  List<Object?> get props => [error];
}

abstract class SitesFirestoreState extends Equatable {}

class SitesInitial extends SitesFirestoreState {
  @override
  List<Object?> get props => [];
}

class SitesList extends SitesFirestoreState {
  final List<SiteMarker> markersList;

  SitesList(this.markersList);

  @override
  List<Object?> get props => [markersList];
}

class CreateSuccess extends SitesFirestoreState {
  @override
  List<Object?> get props => [];
}
