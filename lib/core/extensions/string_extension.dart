extension StringConvertion on String {
  String get toBreakingLineFirestore => this.replaceAll('\\n', '\n');

  String get replaceBreakingLine => this.replaceAll('<br>', '\n');

  String get replaceNewLineWithSpace => this.replaceAll('\n', ' ');
}
