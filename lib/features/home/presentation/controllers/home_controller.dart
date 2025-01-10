import 'package:app/features/home/data/home_repository.dart';
import 'package:app/features/home/domain/entities.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepository repository;

  final player = Rxn<Player>();
  final playerState = Rxn<PlayerState>();

  HomeController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    getPlayer();
    getPlayerState();
  }

  Future<void> getPlayer() async {
    final player = await repository.getPlayer();
    this.player.value = player;
  }

  Future<void> getPlayerState() async {
    final playerState = await repository.getPlayerState();
    this.playerState.value = playerState;
  }
}
