import 'package:flutter/material.dart';

/// Extensions for
/// int, String, Widget, Text, bool, object
/// */

// int
extension NumExtensions on num {
  SizedBox toVerticalSpace() {
    return SizedBox(
      height: toDouble(),
    );
  }

  SizedBox toHorizontalSpace() {
    return SizedBox(
      width: toDouble(),
    );
  }

  BorderRadius toRadius() {
    return BorderRadius.circular(toDouble());
  }

  RoundedRectangleBorder toRoundedRectRadius() {
    return RoundedRectangleBorder(borderRadius: toRadius());
  }
}

// string
extension StringExtensions on String? {
  bool isNullOrEmpty() {
    return (this == null || this!.isEmpty);
  }

  bool isNullOrEmptyNot() {
    return (this != null && this!.isNotEmpty);
  }

  // Text toGrayLabelText() {
  //   return Text(
  //     this ?? "",
  //     textAlign: TextAlign.center,
  //     style: Styles.textFieldLabelStyle,
  //   );
  // }
  //
  // String withoutSpaces() {
  //   return replaceAll(new RegExp(r"\s\b|\b\s"), "");
  // }
}

// widgets
extension WidgetsExtension on Widget {
  // add click
  Widget addInkwell({required Function onClick}) {
    return InkWell(
      child: this,
      onTap: () => onClick(),
    );
  }

  // add padding
  Widget addPaddingAll(num value) {
    return Padding(
      padding: EdgeInsets.all(value.toDouble()),
      child: this,
    );
  }

  // add horizontal padding
  Widget addPaddingHorizontal(num value) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: value.toDouble()),
      child: this,
    );
  }

  // add vertical padding
  Widget addPaddingVertical(num value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: value.toDouble()),
      child: this,
    );
  }

  Widget alignCenterLeft() {
    return Align(alignment: Alignment.centerLeft, child: this);
  }

  Widget alignCenterRight() {
    return Align(alignment: Alignment.centerRight, child: this);
  }

  Widget alignCenter() {
    return Align(alignment: Alignment.center, child: this);
  }
}

// text
extension TextExtensions on Text {
  Text addTextStyle(TextStyle style) {
    return Text(
      data ?? "",
      style: style,
    );
  }
}

//bool
extension BoolExtensions on bool {
  bool not() => !this;
}

//object
extension ObjectExtension on Object? {
  bool isNull() => this == null;

  bool isNotNull() => isNull().not();

  bool isNullOrEmpty() {
    if (this is String) {
      return (isNull() || (this as String).isEmpty);
    } else if (this is List) {
      return (isNull() || (this as List).isEmpty);
    } else {
      return isNull();
    }
  }

  bool isNotNullOrEmpty() => isNullOrEmpty().not();
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
