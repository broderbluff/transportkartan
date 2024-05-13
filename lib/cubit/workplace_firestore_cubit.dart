import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/data/models/workplace_firestore_state.dart';
import 'package:transportkartan/data/models/workplace_model.dart';

class WorkplaceFirestoreCubit extends Cubit<WorkplaceFirestoreState> {
  WorkplaceFirestoreCubit() : super(const InitialState()) {
    fetchAllWorkplaces();
    print('hej');
  }

  void fetchAllWorkplaces() async {
    print('hej');
    emit(const LoadingState());
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
      emit(Failure(e));
    }
  }

  void createWorkplace(Workplace workplace) async {
    try {
      await FirebaseFirestore.instance
          .collection('workplaces')
          .doc(workplace.id) // Set documentId to SiteMarker.id
          .set(workplace.toJson());

      emit(const CreateSuccess());
      emit(const InitialState());
    } catch (e) {
      emit(Failure(e));
    }
  }

  void deleteWorkplace(String workplaceId) async {
    try {
      await FirebaseFirestore.instance.collection('workplaces').doc(workplaceId).delete();

      emit(const CreateSuccess());
      emit(const InitialState());
    } catch (e) {
      emit(Failure(e));
    }
  }

  void updateWorkplace(Workplace workplace) async {
    try {
      await FirebaseFirestore.instance
          .collection('workplaces')
          .doc(workplace.id) // Set documentId to SiteMarker.id
          .update(workplace.toJson());

      emit(const CreateSuccess());
      emit(const InitialState());
    } catch (e) {
      emit(Failure(e));
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
          .where((workplace) => workplace.siteId == siteId && (companyType == null || workplace.companyType == companyType))
          .toList();
    }
    return [];
  }
}
