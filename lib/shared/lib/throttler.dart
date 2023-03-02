import 'dart:async';
import 'dart:ui';

class Throttler {
  /// Задержка в миллисекундах
  final int delay;

  Timer? _timer;

  Throttler(this.delay);

  void run(VoidCallback action) {
    // Если таймер не кончился - выходим
    if (_timer != null) {
      return;
    }

    // Выполняем действие
    action();

    // Запускаем таймер до следующего разрешения действия
    _timer = Timer(Duration(milliseconds: delay), () {
      _timer = null;
    });
  }
}
