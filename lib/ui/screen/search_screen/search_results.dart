import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/ui/common/sigth_image_preloader.dart';

class SearchTitleSelected extends StatelessWidget {
  final String text;
  final String textToSelect;

  SearchTitleSelected({
    @required this.text,
    @required this.textToSelect,
  });

  /// С помощью релугярки, игнорирующей регистр, найдем все вхождения подстроки
  /// в строку и заменим на обернутое в !±...±! значение.
  /// После сплитим по восклицательным знакам, остается массив строк либо в обертке,
  /// либо без нее + пустые строки(ну вдруг рядом два одинаково искомых слова)
  /// Фильруем пустые строки, остаются только строки
  /// Идем по ним, если строка обернута в ± значит оборачиваем в жирный спан,
  /// если нет - то в обычный спан.
  List<TextSpan> _preparedSpans(BuildContext context) {
    return text
        .replaceAllMapped(RegExp(textToSelect, caseSensitive: false), (match) {
          return '!±${match.group(0)}±!';
        })
        .split('!')
        .where((element) => element != '')
        .map(
          (element) {
            if (element.startsWith('±') && element.endsWith('±')) {
              // наш клиент
              return TextSpan(
                text: element.replaceAll('±', ''),
                style: PlacesFonts.size16.copyWith(
                  color: Theme.of(context).textTheme.headline1.color,
                  fontWeight: FontWeight.bold,
                ),
              );
            } else {
              return TextSpan(
                style: PlacesFonts.size16.copyWith(
                  color: Theme.of(context).textTheme.headline1.color,
                ),
                text: element,
              );
            }
          },
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            children: _preparedSpans(context),
          ),
        ],
      ),
    );
  }
}

class SearchResultItem extends StatelessWidget {
  final bool isLast;
  final Sight sight;
  final String sText;
  final String sSelect;

  SearchResultItem({
    @required this.sight,
    this.isLast = false,
    this.sText,
    this.sSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 11,
            ),
            child: Container(
              width: 56,
              height: 56,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Image.network(
                sight.url,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 96,
                loadingBuilder: sightImagePreloader,
              ),
            ),
          ),
          SizedBox(
            width: PlacesSizes.primaryPadding,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: isLast
                    ? null
                    : Border(
                        bottom: BorderSide(
                          color: Theme.of(context).textTheme.subtitle2.color,
                        ),
                      ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: PlacesSizes.primaryHalfPadding,
                    ),
                    // child: SearchTitleSelected(text: 'кофе', textToSelect: 'Кофе',)
                    child: SearchTitleSelected(
                      text: sText,
                      textToSelect: sSelect,
                    ),
                  ),
                  Text(
                    sight.typeVerbose,
                    style: PlacesFonts.size14.copyWith(
                      color: Theme.of(context).textTheme.subtitle1.color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchResults extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: PlacesSizes.doublePrimaryPadding,
        ),
        Expanded(
          child: ListView(
            children: [
              SearchResultItem(
                sight: mocks[0],
                sText: 'Кофе',
                sSelect: 'Кофе',
              ),
              SearchResultItem(
                sight: mocks[0],
                sText: 'Кофейный ресторан',
                sSelect: 'Кофе',
              ),
              SearchResultItem(
                sight: mocks[0],
                sText: 'Кофейный кофекофейный ресторан',
                sSelect: 'Кофе',
              ),
              SearchResultItem(
                sight: mocks[0],
                isLast: true,
                sText: 'Кофейный-кофе',
                sSelect: 'Кофе',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
