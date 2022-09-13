import 'package:cloud_firestore/cloud_firestore.dart';

class ConfigDataSource {
  final FirebaseFirestore db;

  ConfigDataSource(this.db);

  void add() async {
    final config = <String, dynamic>{
      "color": "red",
    };

    db.collection("config").add(config).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  Future<void> update({required String color}) async {
    final config = <String, dynamic>{
      "colorHex": "${color}",
    };
    db.collection('config').doc('ciMcqcxitXeQFHzo3IDU').update(config);
  }
}
