import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/ui/common/icons.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

/// Зеленая кнопка, которая будет вызвать галерею для выбора фоток
class PhotoAddButton extends StatelessWidget {
  final VoidCallback onAdd;

  PhotoAddButton({
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final _isLight = Theme.of(context).brightness == Brightness.light;
    final _borderColor = _isLight
        ? PlacesColors.primaryButtonLight
        : PlacesColors.primaryButtonDark;

    return GestureDetector(
      onTap: () {
        onAdd?.call();
      },
      child: Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 2,
              color: _borderColor.withOpacity(0.48),
            ),
          ),
          child: Center(
            child: Icon(
              Icons.add,
              size: 40.0,
              color: _borderColor,
            ),
          )),
    );
  }
}

/// Превьюшка для фотографии в выборе фотографий
class PhotoItem extends StatelessWidget {
  final dynamic id;
  final VoidCallback onRemove;

  PhotoItem({
    required this.id,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.up,
      onDismissed: (_) {
        onRemove?.call();
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: PlacesSizes.primaryPadding,
        ),
        child: Container(
          width: 72,
          height: 72,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              Positioned(
                child: InkWell(
                  onTap: () {
                    onRemove?.call();
                  },
                  child: SightIconClear(
                    color: Colors.white,
                    width: 20.0,
                    height: 20.0,
                  ),
                ),
                top: 6,
                right: 6,
              ),
              Positioned(
                child: Text(
                  (id as String).substring(
                    0,
                    5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Виджет строки для выбора фоток. Пока не умеет выдавать их наружу,
/// но научится когда придет время
/// Поэтому и данные пока dynamic - на настоящих фотках наверно будет точный тип
class PhotoSelector extends StatefulWidget {
  @override
  _PhotoSelectorState createState() => _PhotoSelectorState();
}

class _PhotoSelectorState extends State<PhotoSelector> {
  final List<dynamic> photos = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          bottom: PlacesSizes.primaryAndHalfPadding,
        ),
        height: 72,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PhotoAddButton(
              onAdd: () {
                setState(() {
                  photos.add(uuid.v4());
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                physics: Platform.isIOS ? BouncingScrollPhysics() : ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: photos.length,
                itemBuilder: (BuildContext context, int index) {
                  return PhotoItem(
                    id: photos[index].toString(),
                    onRemove: () {
                      setState(() {
                        photos.removeAt(index);
                      });
                    },
                  );
                },
              ),
            )
          ],
        ));
  }
}
