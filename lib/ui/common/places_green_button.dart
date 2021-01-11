import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';

/// Виджет для рисования большой зеленой кнопки на странице информации о месте
/// Потом станет настоящей кнопкой
class PlacesGreenButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  PlacesGreenButton({this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: RaisedButton(
        color: Theme.of(context).buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}
