/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/Terrain
  $AssetsImagesTerrainGen get terrain => const $AssetsImagesTerrainGen();
}

class $AssetsTilesGen {
  const $AssetsTilesGen();

  /// File path: assets/tiles/Terrain (16x16).tsx
  String get terrain16x16 => 'assets/tiles/Terrain (16x16).tsx';

  /// File path: assets/tiles/level-1.tmx
  String get level1 => 'assets/tiles/level-1.tmx';

  /// File path: assets/tiles/tiles.tiled-project
  String get tilesTiledProject => 'assets/tiles/tiles.tiled-project';

  /// File path: assets/tiles/tiles.tiled-session
  String get tilesTiledSession => 'assets/tiles/tiles.tiled-session';

  /// List of all assets
  List<String> get values =>
      [terrain16x16, level1, tilesTiledProject, tilesTiledSession];
}

class $AssetsImagesTerrainGen {
  const $AssetsImagesTerrainGen();

  /// File path: assets/images/Terrain/Terrain (16x16).png
  AssetGenImage get terrain16x16 =>
      const AssetGenImage('assets/images/Terrain/Terrain (16x16).png');

  /// List of all assets
  List<AssetGenImage> get values => [terrain16x16];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTilesGen tiles = $AssetsTilesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
