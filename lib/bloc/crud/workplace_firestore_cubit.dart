import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/bloc/crud/workplace_repository.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/data/models/state/workplace_firestore_state.dart';
import 'package:transportkartan/data/models/workplace_model.dart';

class WorkplaceFirestoreCubit extends Cubit<WorkplaceFirestoreState> {
  final WorkplaceRepository repository;
  WorkplaceFirestoreCubit(this.repository) : super(const WorkplaceInitialState());

  void fetchAllWorkplaces() async {
    emit(const WorkplaceLoadingState());
    try {
      List<Workplace> workplaces = await repository.fetchAllWorkplaces();
      emit(AllWorkplaces(workplaces));
    } catch (e) {
      emit(WorkplaceFailure(e));
    }
  }

  void createWorkplace(Workplace workplace) async {
    try {
      await repository.createWorkplace(workplace);
      emit(const WorkplaceCreateSuccess());
      fetchAllWorkplaces();
    } catch (e) {
      emit(WorkplaceFailure(e));
    }
  }

  void deleteWorkplace(String workplaceId) async {
    try {
      await repository.deleteWorkplace(workplaceId);
      emit(const WorkplaceCreateSuccess());
      fetchAllWorkplaces();
    } catch (e) {
      emit(WorkplaceFailure(e));
    }
  }

  void updateWorkplace(Workplace workplace) async {
    try {
      await repository.updateWorkplace(workplace);
      emit(const WorkplaceCreateSuccess());
      fetchAllWorkplaces();
    } catch (e) {
      emit(WorkplaceFailure(e));
    }
  }

  void updateWorkplaces(List<Workplace> workplaces) async {
    try {
      await repository.updateWorkplaces(workplaces);
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

  void findWorkplacesBySiteId(String siteId, {CompanyType? companyType}) async {
    List<Workplace> workplaces = await repository.fetchWorkplacesBySiteId(siteId);

    if (workplaces.isEmpty) {
      emit(const WorkplaceFirestoreState.failure('No workplaces found'));
    } else {
      emit(AllWorkplaces(workplaces));
    }
  }
}
