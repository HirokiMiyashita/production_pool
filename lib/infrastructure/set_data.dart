import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('record');

  Future<void> addUser(User user) {
    return usersCollection.doc().set(user.toMap());
  }
}

class User {
  final String countTime;
  final DateTime dateTime;

  User({required this.countTime, required this.dateTime});

  Map<String, dynamic> toMap() {
    return {'count_time': countTime, 'date_time': dateTime};
  }
}
