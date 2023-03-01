import 'package:flutter/material.dart';

typedef DnDWidgetDirectionListener = void Function(VerticalDirection direction);
typedef DnDWidgetUnsubscribe = void Function();

/// Служебный класс, в который заворачиваю данные Draggable-объекта и мета-информацию о направлении движения
/// DragTarget знает, что над ним будет двигаться объект с этим классом в данных и сможет из направления движения
/// нарисовать плейсхолдер для падения выше или ниже себя
class DnDDataWrapper<T> {
  /// Хранимое значение данных
  T _value;
  /// Существующий листенер, в него либо кладется функция извне, либо зануляется пустой функцией изнутри
  DnDWidgetDirectionListener _listener = (_) {};
  /// Текущее направление движения
  VerticalDirection _direction = VerticalDirection.up;

  DnDDataWrapper(this._value);

  void updateValue(T newValue) {
    _value = newValue;
  }

  DnDWidgetUnsubscribe subscribe(DnDWidgetDirectionListener listener) {
    _listener = listener;
    _listener(_direction);
    return () {
      _listener = (_) {};
      return;
    };
  }

  void setMoveDirection(VerticalDirection newDirection) {
    if (_direction != newDirection) {
      _direction = newDirection;
      _listener(_direction);
    }
  }

  get value => _value;

  get direction => _direction;
}
