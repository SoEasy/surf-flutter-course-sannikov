import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';

/// Разноцветная кнопка для главного экрана
class RainbowButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  RainbowButton({
    this.child,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                PlacesColors.rainbowStart,
                PlacesColors.rainbowEnd,
              ],
            ),
          ),
          child: Container(
            constraints: const BoxConstraints(minWidth: 88.0, minHeight: 48.0),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: child,
          ),
        ),
        onPressed: () {
          onPressed?.call();
        },
      ),
    );
  }
}
