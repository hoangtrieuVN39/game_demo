import 'package:app/features/home/domain/entities/player_model.dart';

class PlayerState {
  final Player player;
  final int health;
  final int attack;
  final int defense;

  const PlayerState({
    required this.player,
    required this.health,
    required this.attack,
    required this.defense,
  });

  factory PlayerState.fromJson(Map<String, dynamic> json) {
    return PlayerState(
      player: Player.fromJson(json['player']),
      health: json['health'],
      attack: json['attack'],
      defense: json['defense'],
    );
  }
}
