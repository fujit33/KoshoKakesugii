import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

@immutable
class Game {
  final DateTime date;
  final String player;
  final int score;
  final int magma;
  DocumentReference reference;

  Game({
    @required this.date,
    @required this.player,
    @required this.score,
    @required this.magma,
  })  : assert(date != null),
        assert(player != null),
        assert(score != null),
        assert(magma != null);

  factory Game.fromSnapshot(DocumentSnapshot snapshot) {
    Game newGame = Game.fromJson(snapshot.data);
    newGame.reference = snapshot.reference;
    return newGame;
  }

  factory Game.fromJson(Map<String, dynamic> json) => _GameFromJson(json);

  Map<String, dynamic> toJson() => _GameToJson(this);
}

Game _GameFromJson(Map<String, dynamic> json) {
  return Game(
    date: json['date'].toDate() as DateTime,
    player: json['player'] as String,
    score: json['score'] as int,
    magma: json['magma'] as int,
  );
}

Map<String, dynamic> _GameToJson(Game instance) => <String, dynamic>{
      'date': instance.date,
      'player': instance.player,
      'score': instance.score,
      'magma': instance.magma,
    };
