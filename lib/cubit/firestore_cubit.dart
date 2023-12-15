import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/models/ferry_port.dart';
import 'package:transportkartan/models/marker_model.dart';

import '../models/combi_terminal.dart';
import '../models/oil_port.dart';

class FirestoreCubit extends Cubit<FirestoreState> {
  FirestoreCubit() : super(FirestoreInitial());

  void fetchMarkerModels() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('markers').get();

    List<MarkerModel> markerModels = [];
    for (var doc in querySnapshot.docs) {
      MarkerModel markerModel;

      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      switch (doc['type']) {
        case 'combiTerminal':
          markerModel = CombiTerminal.fromJson(data);
          break;
        case 'ferryPort':
          markerModel = FerryPort.fromJson(data);
          break;
        case 'oilPort':
          markerModel = OilPort.fromJson(data);
          break;
        default:
          throw Exception('Unknown MarkerModel type: ${doc['type']}');
      }
      markerModels.add(markerModel);
    }
    emit(FirestoreStateWithMarkersList(markerModels));
  }

  void createMarker() {
    // TODO: Implement creating a new marker
  }
}

abstract class FirestoreState extends Equatable {}

class FirestoreInitial extends FirestoreState {
  @override
  List<Object?> get props => [];
}

class FirestoreStateWithMarkersList extends FirestoreState {
  final List<MarkerModel> markersList;

  FirestoreStateWithMarkersList(this.markersList);

  @override
  List<Object?> get props => [markersList];
}
