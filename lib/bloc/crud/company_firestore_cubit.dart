import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/bloc/authentication/auth_cubit.dart';
import 'package:transportkartan/bloc/crud/company_repository.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/data/models/state/company_firestore_state.dart';
import 'package:transportkartan/data/models/user_model.dart';

class CompanyFirestoreCubit extends Cubit<CompanyFirestoreState> {
  final AuthCubit _authCubit;
  final CompanyRepository repository;

  CompanyFirestoreCubit(this._authCubit, this.repository) : super(const CompanyInitialState());

  void fetchAllComapnies() async {
    emit(const CompanyLoadingState());
    UserModel? user = _authCubit.currentUser;

    try {
      List<Company> companies = await repository.fetchAllCompanies(user!.userLevel);
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
      await repository.createCompany(company, user.userLevel);

      emit(const CompanyCreateSuccess());
      fetchAllComapnies();
    } catch (e) {
      emit(CompanyFailure(e));
    }
  }

  void updateCompany(Company company) async {
    try {
      await repository.updateCompany(company);

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
