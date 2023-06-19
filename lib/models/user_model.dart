import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;

  final String username;

  UserModel({
    required this.uid,
    required this.username,
  });

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
      };

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      uid: snapshot['uid'],
      username: snapshot['fullName'],
    );
  }
}
