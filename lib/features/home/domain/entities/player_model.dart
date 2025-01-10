class Player {
  final String name;
  final String image;
  final int level;
  final int xp;

  Player({
    required this.name,
    required this.image,
    required this.level,
    required this.xp,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['name'],
      image: json['image'],
      level: json['level'],
      xp: json['xp'],
    );
  }
}
