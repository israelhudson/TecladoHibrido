import 'package:cloud_firestore/cloud_firestore.dart';

class Controller {
  final FirebaseFirestore db;

  Controller(this.db);

  void add() async {
    final config = <String, dynamic>{
      "color": "red",
    };

    // Add a new document with a generated ID
    db.collection("config").add(config).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
    // [END get_started_add_data_1]
  }

  Future<void> update({required String color}) async {
    final config = <String, dynamic>{
      "colorHex": "${color}",
    };
    db.collection('config').doc('ciMcqcxitXeQFHzo3IDU').update(config);
  }
}
