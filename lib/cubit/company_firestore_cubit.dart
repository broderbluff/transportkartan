import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/enums/company_type.dart';
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
      emit(AllCompaniesState(companies));
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

  void updateCompany(Company company) async {
    try {
      await FirebaseFirestore.instance
          .collection('company')
          .doc(company.id) // Set documentId to SiteMarker.id
          .update(company.toJson());

      emit(CreateSuccess());
      emit(InitialState());
    } catch (e) {
      emit(Failure(e));
    }
  }

  void updateWorkplace(
      CompanyType companyType, String companyId, int employees, int members, int electedOfficials, String siteId) async {
    print(employees);
    try {
      DocumentReference companyRef = FirebaseFirestore.instance.collection('company').doc(companyId);
      DocumentSnapshot companyDoc = await companyRef.get();

      if (companyDoc.exists) {
        Company company = Company.fromJson(companyDoc.data() as Map<String, dynamic>);

        // Find the workplace in the company's workplaces array
        int index = company.workplaces!.indexWhere((workplace) => workplace.siteId == siteId);
        if (index != -1) {
          // Create a new list from the existing workplaces
          List<Workplace> updatedWorkplaces = List<Workplace>.from(company.workplaces!);

// Modify the necessary element
          updatedWorkplaces[index] = updatedWorkplaces[index].copyWith(
            companyType: companyType,
            employees: employees,
            members: members,
            electedOfficials: electedOfficials,
          );

// Update the company document with the new list
          await companyRef.update({'workplaces': updatedWorkplaces.map((workplace) => workplace.toJson()).toList()});
        } else {
          // Create a new Workplace
          Workplace newWorkplace = Workplace(
            siteId: siteId,
            companyType: companyType,
            employees: employees,
            members: members,
            electedOfficials: electedOfficials,
          );

// Create a new list of workplaces that includes the new workplace
          List<Workplace> updatedWorkplaces = [...?company.workplaces, newWorkplace];

// Create a new Company object with the updated workplaces list
          Company updatedCompany = company.copyWith(workplaces: List<Workplace>.from(updatedWorkplaces));

// Update the company document
          await companyRef.update({'workplaces': updatedCompany.workplaces!.map((workplace) => workplace.toJson()).toList()});
        }
      } else {
        throw Exception('Company does not exist');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  // void fetchCompaniesFromId(
  //   List<String> companyIds,
  //   CompanyType companyType,
  // ) async {
  //   emit(LoadingState());
  //   try {
  //     final companies = await Future.wait(
  //       companyIds.map((companyId) => FirebaseFirestore.instance.collection('company').doc(companyId).get()),
  //     );

  //     final companyData = companies
  //         .where((snapshot) => snapshot.exists)
  //         .map((snapshot) => Company.fromJson(snapshot.data() as Map<String, dynamic>))
  //         .toList();

  //     CompanyList companyList = CompanyList();

  //     CompanyListState oldState = state as CompanyListState;

  //     switch (companyType) {
  //       case CompanyType.mainCompany:
  //         companyList = companyList.copyWith(mainCompanies: companyData);
  //         break;
  //       case CompanyType.subContractor:
  //         companyList = companyList.copyWith(subContractors: companyData);
  //         break;
  //       case CompanyType.staffingCompany:
  //         companyList = companyList.copyWith(staffingCompanies: companyData);
  //         break;
  //       case CompanyType.securityCompany:
  //         companyList = companyList.copyWith(securityCompanies: companyData);
  //         break;
  //       case CompanyType.carrierCompany:
  //         companyList = companyList.copyWith(carrierCompanies: companyData);
  //         break;
  //     }

  //     // Merge the old state with the new state
  //     var mergedState = oldState.companyList

  //     emit(mergedState);
  //   } catch (e) {
  //     emit(Failure(e));
  //   }
  // }
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

class AllCompaniesState extends CompanyFirestoreState {
  final List<Company> companyList;

  AllCompaniesState(this.companyList);

  @override
  List<Object?> get props => [companyList];
}

class CreateSuccess extends CompanyFirestoreState {
  @override
  List<Object?> get props => [];
}
