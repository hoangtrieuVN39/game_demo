import 'package:app/features/home/domain/adapters.dart';
import 'package:app/features/home/domain/entities.dart';

class HomeRepository implements IHomeRepository {
  @override
  Future<Player> getPlayer() async {
    return Future.value(Player.fromJson({}));
  }

  @override
  Future<PlayerState> getPlayerState() async {
    return Future.value(PlayerState.fromJson({}));
  }
}
