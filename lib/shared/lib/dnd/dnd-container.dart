import 'package:flutter/material.dart';
import 'package:places/shared/lib/dnd/dnd-data-wrapper.dart';
import 'package:places/shared/lib/throttler.dart';

class DnDContainer<T extends Object> extends StatefulWidget {
  T data;
  final Widget child;
  final Widget? childWhenDragging;
  final Widget Function(T? data) dropPlaceholderBuilder;
  void Function(T data)? onAccept;

  DnDContainer({
    required this.data,
    required this.child,
    this.onAccept,
    this.childWhenDragging,
    required this.dropPlaceholderBuilder
  });

  @override
  State<DnDContainer<T>> createState() {
    return DnDContainerState<T>(data);
  }
}

class DnDContainerState<T extends Object> extends State<DnDContainer<T>> {
  // Значимое для ререндера свойство, куда целится падение виджета
  VerticalDirection? dropPlaceholderPosition;
  // Значимое для ререндера свойство, тащится ли сам виджет
  bool isDrags = false;

  // Тротлить мелкие подергивания пальца, чтоб не мелькал дропПЛейсхолдер вверх-вниз
  Throttler _changeDirectionThrottler = Throttler(600);
  // Наши данные. Нужны чтобы фильтровать падение на самого себя на всякий случай
  DnDDataWrapper<T>? _ownDragData;
  // Данные проплывающего сверху кандидата, нужны для билдера плейсхолдера и фильтрации
  T? _candidateData;
  // Служебный коллбэк отписки от DndDataWrapper
  void Function()? _unsubscribe;


  DnDContainerState(T data) {
    _ownDragData = DnDDataWrapper<T>(data);
  }

  @override
  void didUpdateWidget(covariant DnDContainer<T> oldWidget) {
    // Без такого хака не нашел как заставить объекты при перемещении и перерисовке обновлять свои хранимые данные
    _ownDragData?.updateValue(widget.data);
    super.didUpdateWidget(oldWidget);
  }

  void _draggingObjectDirectionListener(VerticalDirection direction) {
    setState(() {
      dropPlaceholderPosition = direction;
    });
  }

  void _dropSubscription() {
    _unsubscribe?.call();
    _candidateData = null;
    setState(() {
      dropPlaceholderPosition = null;
    });
  }

  Widget build(BuildContext context) {
    return DragTarget<DnDDataWrapper<T>>(
      onWillAccept: (DnDDataWrapper<T>? draggableDataWrapper) {
        if (draggableDataWrapper == _ownDragData) {
          return false;
        }
        if (draggableDataWrapper == null) {
          return false;
        }

        // При заходе виджета на нас - присохраним его данные без обновления стейта
        // Нужно для dropPlaceholderBuilder
        _candidateData = draggableDataWrapper.value;
        _unsubscribe = draggableDataWrapper.subscribe(_draggingObjectDirectionListener);
        return true;
      },
      onLeave: (DnDDataWrapper<T>? draggableData) {
        if (draggableData == _ownDragData) {
          return;
        }
        _dropSubscription();
      },
      onAccept: (DnDDataWrapper<T> draggableData) {
        if (draggableData == _ownDragData) {
          return;
        }
        widget.onAccept?.call(draggableData.value);
        _dropSubscription();
      },
      builder: (BuildContext context, List<Object?> candidateData, List<dynamic> rejectedData) {
        return Column(
          children: [
            // Плейсхолдер дропа
            dropPlaceholderPosition != null && dropPlaceholderPosition == VerticalDirection.up
                ? widget.dropPlaceholderBuilder(_candidateData)
                : SizedBox.shrink(),
            LongPressDraggable(
              data: _ownDragData!,
              onDragUpdate: (DragUpdateDetails dragDetails) {
                _changeDirectionThrottler.run(() {
                  _ownDragData!.setMoveDirection(dragDetails.delta.dy > 0 ? VerticalDirection.down : VerticalDirection.up);
                });
              },
              onDragStarted: () {
                setState(() {
                  isDrags = true;
                });
              },
              onDragEnd: (DraggableDetails details) {
                setState(() {
                  // Тут возможно стоит проверять details.wasAccepted, ставить в стейт, и если true - не рисовать ничего
                  // в ребенке, потому что сейчас будет перерисовка всего экрана
                  isDrags = false;
                });
              },
              // Главный ребенок всегда служит фидбэком в моем компоненте
              feedback: widget.child,
              // Плейсхолдер на место виджета, где он был
              childWhenDragging: widget.childWhenDragging,
              // Когда тащим виджет - не рисуем на его месте ничего - за это отвечает childWhenDragging
              child: isDrags ? SizedBox.shrink() : widget.child,
            ),
            // Плейсхолдер дропа
            dropPlaceholderPosition != null && dropPlaceholderPosition == VerticalDirection.down
                ? widget.dropPlaceholderBuilder(_candidateData)
            // ? Container(width: double.infinity, height: 40)
                : SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
