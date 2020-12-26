import 'package:flutter/material.dart';
import 'package:places/ui/common/icons.dart';

/// Класс для кнопки-иконки на карточке интересного места
/// Принимает иконку и коллбэк-действие
class SightCardActionButton extends StatelessWidget {
  final SightIconBase icon;
  final VoidCallback onPressed;

  SightCardActionButton({
    this.icon,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      child: FlatButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: icon,
      ),
    );
  }
}
