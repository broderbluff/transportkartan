import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/data/models/site_model.dart';

class SiteFirestoreCubit extends Cubit<SiteFirestoreState> {
  SiteFirestoreCubit() : super(InitialState());

  void fetchSites() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('sites').get();

    List<SiteMarker> markerModels = [];
    for (var doc in querySnapshot.docs) {
      final data = doc.data() as Map<String, dynamic>;

      SiteMarker markerModel;
      markerModel = SiteMarker.fromJson(data);

      markerModels.add(markerModel);
    }
    emit(SitesList(markerModels));
  }

  void createSite(SiteMarker markerModel) async {
    try {
      await FirebaseFirestore.instance
          .collection('sites')
          .doc(markerModel.id) // Set documentId to SiteMarker.id
          .set(markerModel.toJson());

      emit(CreateSuccess());
      emit(InitialState());
    } catch (e) {
      emit(CreateFailure(e));
    }
  }
}

class CreateFailure extends SiteFirestoreState {
  final dynamic error;

  CreateFailure(this.error);

  @override
  List<Object?> get props => [error];
}

abstract class SiteFirestoreState extends Equatable {}

class InitialState extends SiteFirestoreState {
  @override
  List<Object?> get props => [];
}

class SitesList extends SiteFirestoreState {
  final List<SiteMarker> markersList;

  SitesList(this.markersList);

  @override
  List<Object?> get props => [markersList];
}

class CompanyList extends SiteFirestoreState {
  final List<Company> companyList;

  CompanyList(this.companyList);

  @override
  List<Object?> get props => [companyList];
}

class CreateSuccess extends SiteFirestoreState {
  @override
  List<Object?> get props => [];
}
