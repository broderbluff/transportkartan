import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/data/models/site_model.dart';

class CompanyRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createCompany(Company company, int userLevel) async {
    if (userLevel == 1) {
      company = company.copyWith(isITF: true);
    }
    try {
      await firestore
          .collection('company')
          .doc(company.id) // Set documentId to SiteMarker.id
          .set(company.toJson());
    } catch (e) {
      throw Exception('Failed to create workplace: $e');
    }
  }

  Future<void> deleteCompany(String companyId) async {
    final docSnapshot = await firestore.collection('company').doc(companyId).get();
    if (docSnapshot.exists) {
      await firestore.collection('company').doc(companyId).delete();
    } else {
      throw Exception('company does not exist');
    }
    await firestore.collection('company').doc(companyId).delete();
  }

  Future<void> updateCompany(Company company) async {
    final docRef = FirebaseFirestore.instance.collection('company').doc(company.id);
    final docSnapshot = await docRef.get();

    if (!docSnapshot.exists) {
      throw Exception('Company does not exist');
    }

    // company = company.copyWith(updatedAt: DateTime.now().toIso8601String()); // Add this line to set the timestamp

    await FirebaseFirestore.instance
        .collection('company')
        .doc(company.id) // Use SiteMarker.id as documentId
        .update(company.toJson());
  }

  Future<List<Company>> fetchAllCompanies(
    int userLevel,
  ) async {
    Query query = firestore.collection('company');

    if (userLevel == 1 || userLevel == 3) {
      query = query.where('isITF', isEqualTo: true);
    }

    query = query.orderBy('name');

    QuerySnapshot querySnapshot = await query.get();

    return querySnapshot.docs.map((doc) => Company.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

  Future<Company> fetchCompanyById(String companyId) async {
    final querySnapshot = await firestore.collection('company').doc(companyId).get();
    if (querySnapshot.exists) {
      return Company.fromJson(querySnapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception('Company does not exist');
    }
  }
}
