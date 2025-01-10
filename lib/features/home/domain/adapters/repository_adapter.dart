import 'package:app/features/home/domain/entities.dart';

abstract class IHomeRepository {
  Future<Player> getPlayer();
  Future<PlayerState> getPlayerState();
}
