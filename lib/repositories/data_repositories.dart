import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kakesugikosho/models/game.dart';

class DataRepository {
  final instance = Firestore.instance;

  Stream<QuerySnapshot> getStream() {
    return instance
        .collection('game')
        .orderBy('score', descending: true)
        .limit(100)
        .snapshots();
  }

  Future<DocumentReference> addGame(Game game) {
    return instance.collection('game').add(game.toJson());
  }
}
