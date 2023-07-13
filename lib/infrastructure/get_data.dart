import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('record');

  Future<List<User>> getUsers() async {
    QuerySnapshot querySnapshot = await usersCollection.get();
    List<User> users = [];
    for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
      users.add(User.fromSnapshot(documentSnapshot));
    }
    return users;
  }
}

class User {
  final String countTime;
  final DateTime dateTime;

  User({required this.countTime, required this.dateTime});

  factory User.fromSnapshot(QueryDocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    final Timestamp timestamp = data['date_time'] as Timestamp;
    final DateTime dateTime = timestamp.toDate();

    return User(
      countTime: data['count_time'] ?? '',
      dateTime: dateTime,
    );
  }
}
