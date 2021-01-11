import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/ui/common/sigth_image_preloader.dart';

/// Базовый класс для карточки интересного места
/// Рисует картинку по ссылке, рисует категорию и предоставляет два слота:
/// actions - действия с карточкой
/// content - слот, помещенный в контейнер с паддингом
/// TODO canDelete - можно ли свайпом открыть действие удаления
/// TODO onDelete - коллбэк на удаление карточки
class SightCardBase extends StatelessWidget {
  final Sight sight;
  final Widget content;
  final List<Widget> actions;
  final Function(Sight sight) onPressed;

  SightCardBase(
    this.sight, {
    this.content,
    this.actions = const [],
    this.onPressed,
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
      child: this.content
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: PlacesSizes.primaryPadding),
      width: double.infinity,
      child: Material(
        borderRadius: BorderRadius.circular(PlacesSizes.primaryPadding),
        clipBehavior: Clip.hardEdge,
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
    );
  }
}
