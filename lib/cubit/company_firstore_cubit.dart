import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/models/company_model.dart';

class CompanyFirestoreCubit extends Cubit<List<Company>> {
  final CollectionReference _companyCollection =
      FirebaseFirestore.instance.collection('companies');

  CompanyFirestoreCubit() : super([]);

  Future<void> getCompanies() async {
    try {
      final querySnapshot = await _companyCollection.get();
      final companies =
          querySnapshot.docs.map((doc) => Company.fromSnapshot(doc)).toList();
      emit(companies);
    } catch (e) {
      // Handle error
    }
  }

  Future<void> addCompany(Company company) async {
    try {
      await _companyCollection.add(company.toMap());
      getCompanies();
    } catch (e) {
      // Handle error
    }
  }

  Future<void> updateCompany(Company company) async {
    try {
      await _companyCollection.doc(company.id).update(company.toMap());
      getCompanies();
    } catch (e) {
      // Handle error
    }
  }

  Future<void> deleteCompany(Company company) async {
    try {
      await _companyCollection.doc(company.id).delete();
      getCompanies();
    } catch (e) {
      // Handle error
    }
  }
}
