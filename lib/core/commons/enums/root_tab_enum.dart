import 'package:app/core/constants.dart';

enum RootTabEnum {
  home,
  list,
  profile,
}

extension RootTabEx on RootTabEnum {
  static RootTabEnum fromIndex(index) {
    switch (index) {
      case 0:
        return RootTabEnum.home;
      case 1:
        return RootTabEnum.list;
      case 2:
        return RootTabEnum.profile;
      default:
        return RootTabEnum.home;
    }
  }

  int get index {
    switch (this) {
      case RootTabEnum.home:
        return 0;
      case RootTabEnum.list:
        return 1;
      case RootTabEnum.profile:
        return 2;
      default:
        return 0;
    }
  }

  String get title {
    switch (this) {
      case RootTabEnum.home:
        return TextConstants.home;
      case RootTabEnum.list:
        return TextConstants.list;
      case RootTabEnum.profile:
        return TextConstants.profile;
      default:
        return TextConstants.home;
    }
  }
}
