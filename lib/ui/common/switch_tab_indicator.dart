import 'package:flutter/material.dart';
import 'package:places/shared/places_colors.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';

/// базовая декорация для контейнера с закругленными угламим на 40dip
BoxDecoration _roundedBoxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(PlacesSizes.switchRadius),
);

/// TabController в виде свича, используется для страницы "Избранные"
/// Возможно оверинжиниринг делать его универсальным, просто было интересно
/// TODO приделать клики, когда научимся
/// TODO приделать анимации, когда научимся
class SwitchTabIndicator extends StatelessWidget {
  final TabController _tabController;
  final List<String> items;

  SwitchTabIndicator(this._tabController, {this.items})
      : assert(items.length == _tabController.length);

  @override
  Widget build(BuildContext context) {
    final _isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: PlacesSizes.primaryPadding,
      ),
      child: Container(
        height: PlacesSizes.switchRadius,
        width: double.infinity,
        decoration: _roundedBoxDecoration.copyWith(
          color: Theme.of(context).backgroundColor,
        ),
        clipBehavior: Clip.hardEdge,
        child: Row(
          children: [
            for (int i = 0; i < items.length; i += 1)
              Expanded(
                flex: 1,
                child: Container(
                  decoration: _roundedBoxDecoration.copyWith(
                    color: i == _tabController.index
                        ? _isLightTheme ? PlacesColors.secondaryLight : Colors.white
                        : Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                      items[i],
                      style: PlacesFonts.size14WeightBold.copyWith(
                          color: i == _tabController.index
                              ? _isLightTheme ? Colors.white : PlacesColors.secondaryLight
                              : PlacesColors.whiteInactive),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
