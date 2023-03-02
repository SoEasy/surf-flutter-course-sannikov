import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';

/// Виджет для рисования большой зеленой кнопки на странице информации о месте
/// Потом станет настоящей кнопкой
class PlacesGreenButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  bool disabled = false;

  PlacesGreenButton({
    required this.child,
    required this.onPressed,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Theme.of(context).buttonColor,
        ),
        child: child,
        onPressed: disabled ? null : onPressed,
      ),
    );
  }
}
