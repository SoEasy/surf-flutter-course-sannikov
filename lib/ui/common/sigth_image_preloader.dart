import 'package:flutter/material.dart';

/// Прелоадер для картинок
/// Важно! Нужно сверху задать ограничение minHeight, потому что картинка от
/// своего height не дает ограничения и прелоадер занимает мало места по высоте
Widget sightImagePreloader(context, child, loadingProgress) {
  if (loadingProgress == null) return child;

  return Center(
    child: CircularProgressIndicator(),
  );
}
