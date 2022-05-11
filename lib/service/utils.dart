String get logTrace =>
    '***[EVENT]*** ' +
    StackTrace.current.toString().split("\n").toList()[1].split("      ").last;

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
