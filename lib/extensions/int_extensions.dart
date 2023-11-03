extension TimeFormatExtension on int {
  String toStrTime(int padlength) {
    return toString().padLeft(padlength, '0');
  }
}
