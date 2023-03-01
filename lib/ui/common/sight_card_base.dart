import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/common/sigth_image_preloader.dart';

/// Базовый класс для карточки интересного места
/// Рисует картинку по ссылке, рисует категорию и предоставляет два слота:
/// actions - действия с карточкой
/// content - слот, помещенный в контейнер с паддингом
/// TODO canDelete - можно ли свайпом открыть действие удаления
/// TODO onDelete - коллбэк на удаление карточки
class SightCardBase extends StatelessWidget {
  final Sight sight;
  final void Function()? onDelete;
  final Widget content;
  final List<Widget> actions;
  final Function(Sight sight)? onPressed;
  final Key? key;

  SightCardBase(
    this.sight, {
    this.onDelete,
    this.key,
    required this.content,
    this.actions = const [],
    this.onPressed,
    this.onDelete
  });

  Widget _image() {
    return Stack(
      children: [
        Container(
          child: Image.network(
            sight.url,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 96,
            loadingBuilder: sightImagePreloader,
          ),
        ),
        Positioned(
          top: PlacesSizes.primaryPadding,
          right: PlacesSizes.primaryPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (int i = 0; i < actions.length; i += 1)
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: actions[i],
                ),
            ],
          ),
        ),
        Positioned(
          top: PlacesSizes.primaryPadding,
          left: PlacesSizes.primaryPadding,
          child: Text(
            sight.typeVerbose,
            style: PlacesFonts.size14WeightBold.copyWith(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _content() {
    return Container(
        padding: EdgeInsets.fromLTRB(
          PlacesSizes.primaryPadding,
          PlacesSizes.primaryPadding,
          PlacesSizes.primaryPadding,
          PlacesSizes.primaryAndHalfPadding,
        ),
        width: double.infinity,
        child: this.content);
  }

  @override
  Widget build(BuildContext context) {
    // Для того, чтобы круглые углы самого виджета при смахивании соответствовали дизайну - использую не background от Dismissable,
    // а виджет в стеке под карточкой с такими же углами
    return Stack(children: [
      Positioned.fill(
        child: Container(
          decoration: BoxDecoration(
            color: PlacesColors.bgDismiss,
            borderRadius: BorderRadius.circular(PlacesSizes.primaryPadding),
          ),
          child: Row(
            children: [
              Expanded(child: SizedBox.shrink()),
              Padding(
                padding: EdgeInsets.only(right: PlacesSizes.primaryPadding),
                // Колонка переполняется при исчезновении Dismissable, поэтому использую Wrap
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [SightIconTrash()]),
                    SizedBox(height: 10),
                    Text('Удалить',
                        style: PlacesFonts.size12.copyWith(
                            color: PlacesColors.textMainDark,
                            fontWeight: FontWeight.w500)
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
      Dismissible(
        direction: DismissDirection.endToStart,
        key: ValueKey(sight.name),
        onDismissed: (DismissDirection _) {
          onDelete();
        },
        child: Container(
          key: key,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(PlacesSizes.primaryPadding),
          ),
          child: Material(
            child: Ink(
              child: InkWell(
                onTap: () {
                  print('On pressed card');
                  onPressed?.call(sight);
                },
                child: Column(
                  children: [_image(), _content()],
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
