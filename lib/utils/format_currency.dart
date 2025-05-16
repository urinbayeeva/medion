String formatNumber(dynamic number, {bool isDecimal = false}) {
  if (number == null) return "0";

  if (isDecimal) {
    double doubleValue = (number is int) ? number.toDouble() : number as double;
    String formatted = doubleValue.toStringAsFixed(2);
    List<String> parts = formatted.split('.');
    String integerPart = parts[0];
    String decimalPart = parts.length > 1 ? parts[1] : "00";

    final buffer = StringBuffer();
    for (int i = 0; i < integerPart.length; i++) {
      if (i > 0 && (integerPart.length - i) % 3 == 0) {
        buffer.write(' ');
      }
      buffer.write(integerPart[i]);
    }

    if (decimalPart != "00") {
      buffer.write('.');
      buffer.write(decimalPart);
    }

    return buffer.toString();
  } else {
    int intValue = (number is double) ? number.toInt() : number as int;
    String numberStr = intValue.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < numberStr.length; i++) {
      if (i > 0 && (numberStr.length - i) % 3 == 0) {
        buffer.write(' ');
      }
      buffer.write(numberStr[i]);
    }
    return buffer.toString();
  }
}
