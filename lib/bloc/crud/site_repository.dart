import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:transportkartan/data/enums/site_type.dart';
import 'package:transportkartan/data/models/site_model.dart';

class SiteRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> createSite(Site site, int userLevel) async {
    if (userLevel == 1) {
      site = site.copyWith(isITF: true);
    }
    try {
      await firestore
          .collection('sites')
          .doc(site.id) // Set documentId to SiteMarker.id
          .set(site.toJson());
    } catch (e) {
      throw Exception('Failed to create workplace: $e');
    }
  }

  Future<void> deleteSite(String siteId) async {
    final docSnapshot = await firestore.collection('sites').doc(siteId).get();
    if (docSnapshot.exists) {
      await firestore.collection('sites').doc(siteId).delete();
    } else {
      throw Exception('Site does not exist');
    }
    await firestore.collection('sites').doc(siteId).delete();
  }

  Future<void> updateSite(Site site) async {
    final docRef = FirebaseFirestore.instance.collection('site').doc(site.id);
    final docSnapshot = await docRef.get();

    if (!docSnapshot.exists) {
      throw Exception('Site does not exist');
    }

    site = site.copyWith(updatedAt: DateTime.now().toIso8601String()); // Add this line to set the timestamp

    await FirebaseFirestore.instance
        .collection('sites')
        .doc(site.id) // Use SiteMarker.id as documentId
        .update(site.toJson());
  }

  Future<List<Site>> fetchAllSites(int userLevel, List<SiteType>? siteTypes, bool sortByType) async {
    Query query = firestore.collection('sites');

    if (userLevel == 1 || userLevel == 3) {
      query = query.where('isITF', isEqualTo: true);
    }
    if (sortByType && siteTypes != null && siteTypes.isNotEmpty) {
      query = query.where('type', whereIn: siteTypes.map((type) => type.returnLast()).toList());
    }

    query = query.orderBy('name');

    QuerySnapshot querySnapshot = await query.get();

    return querySnapshot.docs.map((doc) => Site.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

  Future<Site> fetchSiteById(String siteId) async {
    final querySnapshot = await firestore.collection('sites').doc(siteId).get();
    if (querySnapshot.exists) {
      return Site.fromJson(querySnapshot.data() as Map<String, dynamic>);
    } else {
      throw Exception('Site does not exist');
    }
  }
}
