import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transportkartan/data/models/workplace_model.dart';

class WorkplaceRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> createWorkplace(Workplace workplace) async {
    try {
      final querySnapshot = await firestore
          .collection('workplaces')
          .where('siteId', isEqualTo: workplace.siteId)
          .where('companyType', isEqualTo: workplace.companyType)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        throw Exception('Workplace with the same siteId and companyType already exists');
      }

      await FirebaseFirestore.instance.collection('workplaces').doc(workplace.id).set(workplace.toJson());
    } catch (e) {
      throw Exception('Failed to create workplace: $e');
    }
  }

  Future<void> deleteWorkplace(String workplaceId) async {
    await firestore.collection('workplaces').doc(workplaceId).delete();
  }

  Future<void> updateWorkplace(Workplace workplace) async {
    final docRef = FirebaseFirestore.instance.collection('workplaces').doc(workplace.id);
    final docSnapshot = await docRef.get();

    if (!docSnapshot.exists) {
      throw Exception('Workplace does not exist');
    }

    workplace = workplace.copyWith(updatedAt: DateTime.now().toIso8601String()); // Add this line to set the timestamp

    await FirebaseFirestore.instance
        .collection('workplaces')
        .doc(workplace.id) // Set documentId to SiteMarker.id
        .update(workplace.toJson());
  }

  Future<void> updateWorkplaces(List<Workplace> workplaces) async {
    for (Workplace workplace in workplaces) {
      final docRef = FirebaseFirestore.instance.collection('workplaces').doc(workplace.id);
      final docSnapshot = await docRef.get();
      if (docSnapshot.exists) {
        workplace = workplace.copyWith(updatedAt: DateTime.now().toIso8601String());
        await docRef.update(workplace.toJson());
      } else {
        await docRef.set(workplace.toJson());
      }
    }
  }

  Future<List<Workplace>> fetchAllWorkplaces() async {
    final querySnapshot = await firestore.collection('workplaces').get();
    return querySnapshot.docs.map((doc) => Workplace.fromJson(doc.data())).toList();
  }

  Future<List<Workplace>> fetchWorkplacesBySiteId(
    String siteId,
  ) async {
    final querySnapshot = await firestore.collection('workplaces').where('siteId', isEqualTo: siteId).get();
    if (querySnapshot.docs.isEmpty) {
      return [];
    }
    return querySnapshot.docs.map((doc) => Workplace.fromJson(doc.data())).toList();
  }

  Future<List<Workplace>> fetchWorkplacesByCompanyId(
    String companyId,
  ) async {
    final querySnapshot = await firestore.collection('workplaces').where('companyId', isEqualTo: companyId).get();
    if (querySnapshot.docs.isEmpty) {
      return [];
    }
    return querySnapshot.docs.map((doc) => Workplace.fromJson(doc.data())).toList();
  }
}
