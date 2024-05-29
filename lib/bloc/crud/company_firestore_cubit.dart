import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/bloc/authentication/auth_cubit.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/data/models/state/company_firestore_state.dart';
import 'package:transportkartan/data/models/user_model.dart';

class CompanyFirestoreCubit extends Cubit<CompanyFirestoreState> {
  final AuthCubit _authCubit;

  CompanyFirestoreCubit(this._authCubit) : super(const CompanyInitialState());

  void fetchAllComapnies() async {
    emit(const CompanyLoadingState());
    try {
      UserModel? user = _authCubit.currentUser;

      Query query = FirebaseFirestore.instance.collection('company');
      if (user!.userLevel == 1 || user.userLevel == 3) {
        query = query.where('isITF', isEqualTo: true);
      }

      query = query.orderBy('name');

      QuerySnapshot querySnapshot = await query.get();

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
    UserModel? user = _authCubit.currentUser;

    if (user!.userLevel == 1) {
      company = company.copyWith(isITF: true);
    }
    try {
      await FirebaseFirestore.instance
          .collection('company')
          .doc(company.id) // Set documentId to SiteMarker.id
          .set(company.toJson());

      emit(const CompanyCreateSuccess());
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

      emit(const CompanyCreateSuccess());
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
