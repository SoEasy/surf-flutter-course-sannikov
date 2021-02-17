import 'package:flutter/material.dart';
import 'package:places/shared/places_sizes.dart';

class TextFieldIconWrapper extends StatelessWidget {
  final Widget child;

  TextFieldIconWrapper({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: PlacesSizes.primaryHalfPadding,
        bottom: PlacesSizes.primaryHalfPadding,
      ),
      child: child,
    );
  }
}
