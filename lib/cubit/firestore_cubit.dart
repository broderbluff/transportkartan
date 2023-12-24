import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/data/models/site_model.dart';

class FireStoreCubit extends Cubit<FirestoreState> {
  FireStoreCubit() : super(InitialState());

  void fetchSites() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('sites').get();

    List<SiteMarker> markerModels = [];
    for (var doc in querySnapshot.docs) {
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
      emit(InitialState());
    } catch (e) {
      emit(CreateFailure(e));
    }
  }

  void createCompany(Company company) async {
    try {
      await FirebaseFirestore.instance
          .collection('company')
          .doc(company.id) // Set documentId to SiteMarker.id
          .set(company.toMap());

      emit(CreateSuccess());
      emit(InitialState());
    } catch (e) {
      emit(CreateFailure(e));
    }
  }
}

class CreateFailure extends FirestoreState {
  final dynamic error;

  CreateFailure(this.error);

  @override
  List<Object?> get props => [error];
}

abstract class FirestoreState extends Equatable {}

class InitialState extends FirestoreState {
  @override
  List<Object?> get props => [];
}

class SitesList extends FirestoreState {
  final List<SiteMarker> markersList;

  SitesList(this.markersList);

  @override
  List<Object?> get props => [markersList];
}

class CreateSuccess extends FirestoreState {
  @override
  List<Object?> get props => [];
}
