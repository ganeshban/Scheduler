import 'package:cloud_firestore/cloud_firestore.dart';

class ModelUser {
  final String phone;
  final String username;
  final String email;
  final String userid;

  const ModelUser(
      {required this.phone,
      required this.username,
      required this.email,
      required this.userid});

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "username": username,
        "email": email,
        "userid": userid,
      };
  static ModelUser fromMap(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return ModelUser(
      email: snap["email"],
      phone: snap["phone"],
      userid: snap['userid'],
      username: snap["username"],
    );
  }
}
