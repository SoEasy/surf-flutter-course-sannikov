import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';

/// Виджет для отрисовки элемента истории поиска
class SearchHistoryItem extends StatelessWidget {
  final String title;
  final VoidCallback? onDelete;
  final bool isLast;

  SearchHistoryItem({
    required this.title,
    this.isLast = false,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 15, bottom: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  title,
                  style: PlacesFonts.size16.copyWith(
                    color: Theme.of(context).textTheme.subtitle1?.color,
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  onDelete?.call();
                },
                child: SightIconDelete(),
              ),
            ],
          ),
        ),
        isLast ? SizedBox.shrink() : Divider()
      ],
    );
  }
}

/// Виджет для отрисовки списка истории поиска
class SearchHistory extends StatelessWidget {
  final List<String> items;

  SearchHistory({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: PlacesSizes.doublePrimaryPadding,
        ),
        Text(
          PlacesTexts.searchHistoryTitle.toUpperCase(),
          style: PlacesFonts.size12.copyWith(
            color: Theme.of(context).textTheme.subtitle2?.color,
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: Platform.isIOS ? BouncingScrollPhysics() : ClampingScrollPhysics(),
            itemCount: items.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index != items.length) {
                return SearchHistoryItem(
                  title: items[index],
                  onDelete: () {
                    print('Remove ${items[index]}');
                  },
                  isLast: index == items.length - 1,
                );
              } else {
                return InkWell(
                  onTap: () {
                    print('clear history');
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: PlacesSizes.primaryPadding,
                    ),
                    child: Text(
                      PlacesTexts.searchHistoryClear,
                      style: PlacesFonts.size16Weight500.copyWith(
                        color: Theme.of(context).buttonColor,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        )
      ],
    );
  }
}
