import 'package:admin_repository/admin_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAdminRepo {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  FirebaseAdminRepo(this._firestore, this._storage);

  Future<void> addAdmin(Admin admin) async {
    // await _firestore.collection('admins').doc().set(admin.());
  }

  // Future<void> deleteAdmin(String id) async {
  //   await _firestore.collection('admins').doc(id).delete();
  // }

  // Future<List<Admin>> getAdmins() async {
  //   final snapshot = await _firestore.collection('admins').get();
  //   return snapshot.docs.map((doc) => Admin.fromJson(doc.data())).toList();
  // }

  // Future<void> updateAdmin(Admin admin) async {
  //   await _firestore.collection('admins').doc(admin.id).update(admin.toJson());
  // }

  // Future<void> uploadImage(String id, File image) async {
  //   final ref = _storage.ref().child('admins').child(id);
  //   await ref.putFile(image);
  // }
}

class FirebaseStorage {}
