import 'package:flutter/material.dart';

/// Алиасы для типографики
class PlacesFonts {
  static final TextStyle _roboto = TextStyle(
    fontFamily: 'Roboto',
  );

  static final TextStyle size12 = PlacesFonts._roboto.copyWith(
    fontSize: 12,
    height: 1.33,
  );

  static final TextStyle size14 = PlacesFonts._roboto.copyWith(
    fontSize: 14,
    height: 1.28,
  );

  static final TextStyle size14WeightBold = PlacesFonts.size14.copyWith(
    fontWeight: FontWeight.bold,
  );

  static final TextStyle size16 = PlacesFonts._roboto.copyWith(
    fontSize: 16,
    height: 1.25,
  );

  static final TextStyle size18 = PlacesFonts._roboto.copyWith(
    fontSize: 18,
    height: 1.33,
  );

  static final TextStyle size18Weight500 = PlacesFonts.size18.copyWith(
    fontWeight: FontWeight.w500,
  );

  static final TextStyle size24 = PlacesFonts._roboto.copyWith(
    fontSize: 24,
    height: 1.25,
  );

  static final TextStyle size24WeightBold = PlacesFonts.size24.copyWith(
    fontWeight: FontWeight.bold,
  );

  static final TextStyle size16Weight500 = PlacesFonts.size16.copyWith(
    fontWeight: FontWeight.w500,
  );

  static final TextStyle size32 = PlacesFonts._roboto.copyWith(
    fontSize: 32,
    height: 1.125, // line-height 36
  );

  static final TextStyle size32WeightBold = PlacesFonts.size32.copyWith(
    fontWeight: FontWeight.w700,
  );
}
