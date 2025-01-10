import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Level extends World {
  late TiledComponent level;

  @override
  FutureOr<void> onLoad() async {
    level = await TiledComponent.load('level-1.tmx', Vector2.all(16));
    add(level);
    await super.onLoad();
  }

  TiledComponent get tiledComponent => children.query<TiledComponent>().single;
}
