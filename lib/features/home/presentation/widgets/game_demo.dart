import 'dart:developer';
import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'level.dart';
import 'package:flame/input.dart';
import 'package:flame/events.dart';
import 'character.dart';

class GameDemo extends FlameGame {
  @override
  Color backgroundColor() => const Color(0xFF211F30);

  late final CameraComponent cam;
  final world = Level();
  late final Character character;
  late final ButtonComponent leftButton;
  late final ButtonComponent rightButton;
  late final ButtonComponent jumpButton;
  late final FpsTextComponent fpsText;

  @override
  Future<void> onLoad() async {
    cam = CameraComponent.withFixedResolution(
        world: world, width: 680, height: 360);
    cam.viewfinder.anchor = Anchor.topLeft;

    character = Character();

    fpsText = FpsTextComponent(
      textRenderer: TextPaint(
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );

    leftButton = ButtonComponent(
      button: RectangleComponent(
        size: Vector2(50, 50),
        paint: Paint()..color = Colors.blue,
      ),
      onPressed: () {
        character.startMovingLeft();
      },
      onCancelled: () {
        character.stopMoving();
      },
      onReleased: () {
        character.stopMoving();
      },
      scale: Vector2(1.5, 1.5),
      position: Vector2(40, size.y - 150), // Adjust position as needed
    );

    rightButton = ButtonComponent(
      button: RectangleComponent(
        size: Vector2(50, 50),
        paint: Paint()..color = Colors.green,
      ),
      onPressed: () {
        character.startMovingRight();
      },
      onCancelled: () {
        character.stopMoving();
      },
      onReleased: () {
        character.stopMoving();
      },
      scale: Vector2(1.5, 1.5),
      position: Vector2(120, size.y - 150), // Adjust position as needed
    );

    jumpButton = ButtonComponent(
      button: CircleComponent(radius: 30, paint: Paint()..color = Colors.red),
      onPressed: () {
        character.jump();
      },
      scale: Vector2(1.5, 1.5),
      position:
          Vector2(size.x - 120, size.y - 180), // Adjust position as needed
    );

    await addAll(
        [cam, world, character, leftButton, rightButton, jumpButton, fpsText]);

    super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    character.update(dt);
  }
}
