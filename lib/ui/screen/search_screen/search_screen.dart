import 'package:flutter/material.dart';
import 'package:places/shared/places_fonts.dart';
import 'package:places/shared/places_sizes.dart';
import 'package:places/shared/places_texts.dart';
import 'package:places/ui/common/icons.dart';
import 'package:places/ui/navigation/sight_bottom_navigator.dart';
import 'package:places/ui/screen/search_screen/no_search_results.dart';
import 'package:places/ui/screen/search_screen/search_history.dart';
import 'package:places/ui/screen/search_screen/search_results.dart';
import 'package:places/ui/screen/widgets/search_bar.dart';


/// Виджет экрана поиска, по надобности влючает в себя один из трех виджетов:
/// - историю поиска
/// - ничего не найдено
/// - найденные элементы
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    searchController.addListener(() {
      print('Text changed ${searchController.text}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        title: Text(
          PlacesTexts.sightListTitle,
          style: PlacesFonts.size16.copyWith(
            color: Theme.of(context).textTheme.headline1.color,
          ),
        ),
      ),
      bottomNavigationBar: SightBottomNavigator(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: PlacesSizes.primaryPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              controller: searchController,
              icon: SightIconClear(withTheme: true,),
              onInputIconTap: () {
                searchController.text = '';
              },
            ),
            Expanded(
              // child: NoSearchResults(),
              // child: SearchResults(),
              child: SearchHistory(
                items: [
                  'Кофейня у Рустама в какой-то тьмутаракани',
                  'Памятник',
                  'Музей истории',
                  'Зеленые рощи',
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
