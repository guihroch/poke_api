// ignore_for_file: constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  final Color color;
  AppTextStyles._(this.color);

  static const TextStyle NUNITO_700_BIG = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w700,
    fontFamily: 'Nunito',
  );
  static const TextStyle NUNITO_700_MEDIUM = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: 'Nunito',
  );
  static const TextStyle NUNITO_700_LOW = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: 'Nunito',
  );

  static const TextStyle NUNITO_600_BIG = TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.w600,
    fontFamily: 'Nunito',
  );

  static const TextStyle NUNITO_400_MEDIUM = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nunito',
  );
  static const TextStyle NUNITO_400_LOW = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nunito',
  );
}
