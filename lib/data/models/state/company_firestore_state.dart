import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:transportkartan/data/models/company_model.dart';
part 'company_firestore_state.freezed.dart';

@freezed
abstract class CompanyFirestoreState with _$CompanyFirestoreState {
  const factory CompanyFirestoreState.initial() = CompanyInitialState;
  const factory CompanyFirestoreState.loading() = CompanyLoadingState;
  const factory CompanyFirestoreState.allSites(List<Company> companyList) = AllCompanies;
  const factory CompanyFirestoreState.createSuccess() = CompanyCreateSuccess;
  const factory CompanyFirestoreState.failure(dynamic error) = CompanyFailure;
}
