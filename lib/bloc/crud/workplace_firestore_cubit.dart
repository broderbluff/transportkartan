import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/data/models/state/workplace_firestore_state.dart';
import 'package:transportkartan/data/models/workplace_model.dart';

class WorkplaceFirestoreCubit extends Cubit<WorkplaceFirestoreState> {
  WorkplaceFirestoreCubit() : super(const WorkplaceInitialState()) {
    fetchAllWorkplaces();
  }

  void fetchAllWorkplaces() async {
    emit(const WorkplaceLoadingState());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('workplaces').get();

      List<Workplace> workplaces = [];
      for (var doc in querySnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        Workplace workplace;
        workplace = Workplace.fromJson(data);

        workplaces.add(workplace);
      }
      emit(AllWorkplaces(workplaces));
    } catch (e) {
      emit(WorkplaceFailure(e));
    }
  }

  void createWorkplace(Workplace workplace) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('workplaces')
          .where('siteId', isEqualTo: workplace.siteId)
          .where('companyType', isEqualTo: workplace.companyType)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        throw Exception('Workplace with the same siteId and companyType already exists');
      }

      await FirebaseFirestore.instance.collection('workplaces').doc(workplace.id).set(workplace.toJson());

      emit(const WorkplaceCreateSuccess());
      fetchAllWorkplaces();
    } catch (e) {
      emit(WorkplaceFailure(e));
    }
  }

  void deleteWorkplace(String workplaceId) async {
    try {
      await FirebaseFirestore.instance.collection('workplaces').doc(workplaceId).delete();

      emit(const WorkplaceCreateSuccess());
      fetchAllWorkplaces();
    } catch (e) {
      emit(WorkplaceFailure(e));
    }
  }

  void updateWorkplace(Workplace workplace) async {
    try {
      final docRef = FirebaseFirestore.instance.collection('workplaces').doc(workplace.id);
      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        throw Exception('Workplace does not exist');
      }

      workplace = workplace.copyWith(updatedAt: DateTime.now().toIso8601String()); // Add this line to set the timestamp

      await FirebaseFirestore.instance
          .collection('workplaces')
          .doc(workplace.id) // Set documentId to SiteMarker.id
          .update(workplace.toJson());

      emit(const WorkplaceCreateSuccess());
      fetchAllWorkplaces();
    } catch (e) {
      emit(WorkplaceFailure(e));
    }
  }

  Workplace findWorkplaceById(String companyId, String siteId) {
    final state = this.state;
    if (state is AllWorkplaces) {
      return state.workplaceList.firstWhere((workplace) => workplace.companyId == companyId && workplace.siteId == siteId,
          orElse: () => Workplace.empty());
    }
    return Workplace.empty();
  }

  List<Workplace> findWorkplacesByCompanyId(
    String companyId,
  ) {
    final state = this.state;
    if (state is AllWorkplaces) {
      return state.workplaceList.where((workplace) => workplace.companyId == companyId).toList();
    }
    return [];
  }

  List<Workplace> findWorkplacesBySiteId(String siteId, {CompanyType? companyType}) {
    final state = this.state;
    if (state is AllWorkplaces) {
      return state.workplaceList
          .where((workplace) =>
              workplace.siteId == siteId &&
              workplace.companyType == companyType) //&& (companyType == null || workplace.companyType == companyType) s
          .toList();
    }
    return [];
  }
}
