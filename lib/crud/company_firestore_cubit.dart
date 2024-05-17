import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/data/models/state/company_firestore_state.dart';

class CompanyFirestoreCubit extends Cubit<CompanyFirestoreState> {
  CompanyFirestoreCubit() : super(CompanyInitialState());

  void fetchAllComapnies() async {
    emit(CompanyLoadingState());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('company').get();

      List<Company> companies = [];
      for (var doc in querySnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        Company company;
        company = Company.fromJson(data);

        companies.add(company);
      }
      emit(AllCompanies(companies));
    } catch (e) {
      emit(CompanyFailure(e));
    }
  }

  void createCompany(Company company) async {
    try {
      await FirebaseFirestore.instance
          .collection('company')
          .doc(company.id) // Set documentId to SiteMarker.id
          .set(company.toJson());

      emit(CompanyCreateSuccess());
      fetchAllComapnies();
    } catch (e) {
      emit(CompanyFailure(e));
    }
  }

  void updateCompany(Company company) async {
    try {
      await FirebaseFirestore.instance
          .collection('company')
          .doc(company.id) // Set documentId to SiteMarker.id
          .update(company.toJson());

      emit(CompanyCreateSuccess());
      fetchAllComapnies();
    } catch (e) {
      emit(CompanyFailure(e));
    }
  }

  Company findCompanyById(String companyId) {
    final state = this.state;
    if (state is AllCompanies) {
      return state.companyList.firstWhere((company) => company.id == companyId, orElse: () => Company.empty());
    }
    return Company.empty();
  }
}
