import 'package:app/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

const Color _activeNavBottomIcon = Color(0xFFF2F2F2);
const Color _backgroundColor = Color(0xFFFFFFFF);
const Color _unSafeAreaColor = Color(0xFFFFFFFF);
const Color _surfaceColor = Color(0xFFFFFFFF);
const Color _mainColor = Color(0xFF0B46BD);
const Color _defaultBackgroundButtonColor = Color(0xFFFFFFFF);
const Color _textButtonColor = Color(0xFFFFFFFF);
const Color _titleListColor = Color(0xFF333333);
const Color _borderListColor = Color(0x57545456);
const Color _subTextColor = Color(0xFF333333);
const Color _mainAppBarCustom = Color(0xFF007AFF);
const Color _texQuestionSuppprtAreaColor = Color(0xFF0146BD);
const Color _boxShadownQuestionSupportColor = Color(0x2E000000);
const Color _borderInputSearchColor = Color(0x1F000000);
const Color _hintTextSearchColor = Color(0x33000000);
const Color _boxShadownCalendarColor = Color(0x66000000);
const Color _textCalendarColor = Color(0xFF333333);
const Color _activeBottomNavColor = Color(0xFF0146BD);
const Color _inactiveBottomNavColor = Color(0xFF8A8F99);
const Color _borderLineNavColor = Color(0xFFD9D9D9);
const Color _bgTrophyCollectionColor = Color(0xFFF2F3F5);
const Color _textItemTrophyCollectionColor = Color(0xFF8A8F99);
const Color _boderItemAccountSettingColor = Color(0x54545657);
const Color _boderItemSupportColor = Color(0x54545657);
const Color _textTitleButtonLoginColor = Color(0xFF0146BD);
const Color _boderButtonLoginColor = Color(0xFF0B46BD);
const Color _textPolicyLoginColor = Color(0xFF007AFF);
const Color _boderItemDocumentColor = Color(0x57545456);
const Color _borderItemSupportColor = Color(0x54545657);
const Color _textDayOfWeekColor = Color(0xFF9BA0A9);
const Color _textFieldColor = Color(0xFFF2F3F5);
const Color _textButtonDisableColor = Color(0xFFB6B6B9);
const Color _backgroundActiveSelectedColor = Color(0xFFF5F9FF);
const Color _backgroundDivideDotColor = Color(0xFF666666);
const Color _backgroundButtonDisableColor = Color(0xFFE7E7E8);
const Color _bgHomeColor = Color(0xFFF2F2F2);

const MaterialColor _primaryColor = MaterialColor(
  0xFF0000FF,
  <int, Color>{
    900: Color(0xFF0000B3),
    800: Color(0xFF0000CC),
    700: Color(0xFF0000E5),
    600: Color(0xFF0000FF),
    500: Color(0xFF1A1AFF),
    400: Color(0xFF3333FF),
    300: Color(0xFF4D4DFF),
    200: Color(0xFF6666FF),
    100: Color(0xFF8080FF),
  },
);

const MaterialColor _greyColor = MaterialColor(
  0xFF757575,
  <int, Color>{
    900: Color(0xFF212121),
    800: Color(0xFF424242),
    700: Color(0xFF616161),
    600: Color(0xFF757575),
    500: Color(0xFF9E9E9E),
    400: Color(0xFFBDBDBD),
    300: Color(0xFFE0E0E0),
    200: Color(0xFFEEEEEE),
    100: Color(0xFFF5F5F5),
  },
);

const List<Color> _progressGradientColors = [
  Color(0xFF0146BD),
  Color(0xFF2E86D3)
];

const List<Color> _progressGradientSurveyColors = [
  Color(0xFF0F59C4),
  Color(0xFF2275CE)
];

const _bgProgressBarlG = [
  Color(0xFF0146BD),
  Color(0xFF639BF2),
];

extension PofPofColorScheme on ColorScheme {
  Color get activeNavBottomIcon => _activeNavBottomIcon;
  MaterialColor get primaryBlue => _primaryColor;
  MaterialColor get grey => _greyColor;
  Color get backgroundColor => _backgroundColor;
  Color get unSafeAreaColor => _unSafeAreaColor;
  Color get surfaceColor => _surfaceColor;
  Color get mainColor => _mainColor;
  Color get defaultBackgroundButtonColor => _defaultBackgroundButtonColor;
  Color get textButtonColor => _textButtonColor;
  Color get titleListColor => _titleListColor;
  Color get subTextColor => _subTextColor;
  Color get borderListColor => _borderListColor;
  Color get mainAppBarCustom => _mainAppBarCustom;
  Color get texQuestionSuppprtAreaColor => _texQuestionSuppprtAreaColor;
  Color get borderInputSearchColor => _borderInputSearchColor;
  Color get hintTextSearchColor => _hintTextSearchColor;
  Color get boxShadownQuestionSupportColor => _boxShadownQuestionSupportColor;
  Color get boxShadownCalendarColor => _boxShadownCalendarColor;
  Color get textCalendarColor => _textCalendarColor;
  Color get activeBottomNavColor => _activeBottomNavColor;
  Color get inactiveBottomNavColor => _inactiveBottomNavColor;
  Color get borderLineNavColor => _borderLineNavColor;
  Color get bgTrophyCollectionColor => _bgTrophyCollectionColor;
  Color get textItemTrophyCollectionColor => _textItemTrophyCollectionColor;
  Color get boderItemAccountSettingColor => _boderItemAccountSettingColor;
  Color get boderItemSupportColor => _boderItemSupportColor;
  Color get textTitleButtonLoginColor => _textTitleButtonLoginColor;
  Color get boderButtonLoginColor => _boderButtonLoginColor;
  Color get textPolicyLoginColor => _textPolicyLoginColor;
  Color get borderItemDocumentColor => _boderItemDocumentColor;
  Color get borderItemSupportColor => _borderItemSupportColor;
  Color get textDayOfWeekColor => _textDayOfWeekColor;
  List<Color> get progressGradientSurveyColors => _progressGradientSurveyColors;
  Color get backgroundActiveSelectedColor => _backgroundActiveSelectedColor;
  Color get backgroundDivideDotColor => _backgroundDivideDotColor;
  Color get textFieldColor => _textFieldColor;
  Color get backgroundButtonDisableColor => _backgroundButtonDisableColor;
  Color get textButtonDisableColor => _textButtonDisableColor;
}

class AppTheme {
  static ThemeData theme() {
    return ThemeData(
      fontFamily: FontFamily.hiraginoKakuGothicPro,
      appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
      textSelectionTheme: TextSelectionThemeData(
        selectionColor: _primaryColor[100],
      ),
      scaffoldBackgroundColor: _backgroundColor,
      textTheme: const TextTheme(
      ),
    );
  }
}
