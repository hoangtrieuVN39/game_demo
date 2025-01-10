import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart';

class Character extends SpriteAnimationComponent {
  Vector2? targetPosition;
  bool isJumping = false;
  double jumpSpeed = -300; // Adjust jump speed
  double gravity = 600; // Adjust gravity
  double groundLevel = 380; // Adjust to match the tile height
  double moveSpeed = 50; // Adjust move speed
  Vector2 movementDirection = Vector2.zero();

  late SpriteAnimation idleAnimation;
  late SpriteAnimation moveAnimation;
  late SpriteAnimation jumpAnimation;

  Character()
      : super(
            size: Vector2(32, 32),
            position: Vector2(40, 380)); // Initial position on tile

  @override
  Future<void> onLoad() async {
    final idleSpriteSheet = SpriteSheet(
      image:
          await Flame.images.load('Main Characters/Pink Man/Idle (32x32).png'),
      srcSize: Vector2(32, 32),
    );

    final moveSpriteSheet = SpriteSheet(
      image:
          await Flame.images.load('Main Characters/Pink Man/Run (32x32).png'),
      srcSize: Vector2(32, 32),
    );

    final jumpSpriteSheet = SpriteSheet(
      image:
          await Flame.images.load('Main Characters/Pink Man/Jump (32x32).png'),
      srcSize: Vector2(32, 32),
    );

    idleAnimation =
        idleSpriteSheet.createAnimation(row: 0, stepTime: 0.1, to: 10);
    moveAnimation =
        moveSpriteSheet.createAnimation(row: 0, stepTime: 0.1, to: 10);
    jumpAnimation =
        jumpSpriteSheet.createAnimation(row: 0, stepTime: 0.1, to: 1);

    animation = idleAnimation;
    anchor = Anchor.center;
  }

  void setGroundLevel(double groundLevel) {
    this.groundLevel = groundLevel;
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Apply gravity
    if (isJumping || position.y < groundLevel) {
      position.y += jumpSpeed * dt;
      jumpSpeed += gravity * dt;

      // Check if character has landed
      if (position.y >= groundLevel) {
        position.y = groundLevel;
        isJumping = false;
        jumpSpeed = -300; // Reset jump speed
        animation = idleAnimation; // Switch to idle animation
      }
    }

    // Apply movement
    position += movementDirection * moveSpeed * dt;

    // Switch animation based on movement
    if (movementDirection.x != 0 && !isJumping) {
      animation = moveAnimation;
    } else if (!isJumping) {
      animation = idleAnimation;
    }
  }

  void startMovingLeft() {
    movementDirection = Vector2(-1, 0);
    scale.x = -1; // Flip character horizontally
  }

  void startMovingRight() {
    movementDirection = Vector2(1, 0);
    scale.x = 1; // Reset character to normal
  }

  void stopMoving() {
    movementDirection = Vector2.zero();
  }

  void jump() {
    if (!isJumping) {
      isJumping = true;
      jumpSpeed = -300; // Ensure jump speed is reset
      animation = jumpAnimation; // Switch to jump animation
    }
  }
}
