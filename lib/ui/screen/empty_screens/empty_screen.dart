import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';

/// Базовый компонент для экрана, на котором надо показать пользователю
/// "ничего нету"
/// Принимает иконку, заголовок и текст
class EmptyScreen extends StatelessWidget {
  final Widget icon;
  final String title;
  final String text;

  EmptyScreen({
    this.icon,
    this.title,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [icon],
        ),
        SizedBox(
          height: PlacesSizes.doublePrimaryPadding,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: PlacesFonts.size18.copyWith(
            color: PlacesColors.whiteInactive,
          ),
        ),
        SizedBox(
          height: PlacesSizes.primaryHalfPadding,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: PlacesFonts.size14.copyWith(
            color: PlacesColors.whiteInactive,
          ),
        )
      ],
    );
  }
}
