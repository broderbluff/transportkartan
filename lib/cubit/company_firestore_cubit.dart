import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/models/company_model.dart';

class CompanyFirestoreCubit extends Cubit<CompanyFirestoreState> {
  CompanyFirestoreCubit() : super(InitialState());

  void fetchAllComapnies() async {
    emit(LoadingState());
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('company').get();

      List<Company> companies = [];
      for (var doc in querySnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        Company company;
        company = Company.fromJson(data);

        companies.add(company);
      }
      emit(CompanyListState(companies));
    } catch (e) {
      emit(Failure(e));
    }
  }

  void createCompany(Company company) async {
    try {
      await FirebaseFirestore.instance
          .collection('company')
          .doc(company.id) // Set documentId to SiteMarker.id
          .set(company.toJson());

      emit(CreateSuccess());
      emit(InitialState());
    } catch (e) {
      emit(Failure(e));
    }
  }

  void fetchCompaniesFromId(List<String> companyIds) async {
    emit(LoadingState());
    try {
      final companies = await Future.wait(
        companyIds.map((companyId) => FirebaseFirestore.instance.collection('company').doc(companyId).get()),
      );

      final companyData = companies
          .where((snapshot) => snapshot.exists)
          .map((snapshot) => Company.fromJson(snapshot.data() as Map<String, dynamic>))
          .toList();

      emit(CompanyListFetchedByIdState(companyData));
    } catch (e) {
      emit(Failure(e));
    }
  }
}

class Failure extends CompanyFirestoreState {
  final dynamic error;

  Failure(this.error);

  @override
  List<Object?> get props => [error];
}

abstract class CompanyFirestoreState extends Equatable {}

class InitialState extends CompanyFirestoreState {
  @override
  List<Object?> get props => [];
}

class LoadingState extends CompanyFirestoreState {
  @override
  List<Object?> get props => [];
}

class CompanyListState extends CompanyFirestoreState {
  final List<Company> companyList;

  CompanyListState(this.companyList);

  @override
  List<Object?> get props => [companyList];
}

class CompanyListFetchedByIdState extends CompanyFirestoreState {
  final List<Company> companyList;

  CompanyListFetchedByIdState(this.companyList);

  @override
  List<Object?> get props => [companyList];
}

class CreateSuccess extends CompanyFirestoreState {
  @override
  List<Object?> get props => [];
}
