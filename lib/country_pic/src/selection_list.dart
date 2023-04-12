import 'package:flutter/material.dart';
import 'package:labook/commons/common_libs.dart';
import 'package:provider/provider.dart';
import 'model/country.dart';
import 'model/languages.dart';
import 'provider/picker_provider.dart';
import 'widget/lastpick_tile.dart';
import 'widget/alphabet_scroll.dart';
import 'widget/current_location_tile.dart';
import 'widget/country_list_tile.dart';
import 'widget/search_tile.dart';
import 'theme/dialog_theme.dart';
import 'model/names.dart';

class SelectionList extends StatelessWidget {
  SelectionList(
    this.elements, {
    super.key,
    required this.selectedCountry,
    this.localCountry,
    this.appBar,
    this.dialogTheme = const DialogThemeData(),
    this.textDirection = TextDirection.ltr,
    required this.language,
    this.displayName = Names.common,
  });

  final PreferredSizeWidget? appBar;
  final List<Country> elements;
  final Country selectedCountry;
  final Country? localCountry;
  final TextDirection textDirection;
  final Languages language;
  final DialogThemeData dialogTheme;
  final TextEditingController _controller = TextEditingController();
  final Names displayName;

  @override
  Widget build(BuildContext context) {
    int boxes = 0;
    ScrollController controllerScroll = ScrollController();

    controllerScroll.addListener(() {
      SettingsProvider settings = context.read<SettingsProvider>();
      settings.isShowFloatButton = controllerScroll.position.pixels != 0;
      int scrollPosition =
          ((controllerScroll.position.pixels) / dialogTheme.tileHeight).round();

      if (scrollPosition < boxes) {
        settings.selectedCharacter = null;
      } else if (scrollPosition >= boxes && scrollPosition <= elements.length) {
        settings.selectedCharacter = (displayName == Names.common)
            ? elements.elementAt(scrollPosition - boxes).name.common[0]
            : elements.elementAt(scrollPosition - boxes).name.official[0];
      }
    });

    if (dialogTheme.isShowSearchTile == true) boxes += 2;
    if (localCountry != null) boxes += 2;
    if (dialogTheme.isShowLastPickTile == true) boxes += 2;

    return Directionality(
      textDirection: textDirection,
      child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
              color: dialogTheme.backgroundColor ??
                  Theme.of(context).colorScheme.surface,
              child: CustomScrollView(
                controller: controllerScroll,
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(children: [
                      Padding(
                        padding:EdgeInsets.symmetric(horizontal:20.w,vertical: 20.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Your country",style: getBoldStyle(fontSize: 20.spMin,color: Theme.of(context).colorScheme.secondary),),
                            InkWell(
                              onTap: (){
                                Navigator.pop(context);
                              },
                              child: Row(
                                children: [
                                  Text("Cancel",style: getMediumStyle(fontSize: 14.spMin,color: Theme.of(context).primaryColor),),
                                  IconButton(
                                    constraints: const BoxConstraints(),padding: EdgeInsets.zero,
                                      onPressed: (){

                                  }, icon: Icon(Icons.close,color:Theme.of(context).primaryColor ,size: 20.h,)),
                                ],
                              ),
                            )

                          ],
                        ),
                      ),
                      if (dialogTheme.isShowLastPickTile)
                        LastPickTile(
                          displayName: displayName,
                          dialogTheme: dialogTheme,
                          country: selectedCountry,
                          language: language,
                        ),
                    ]),
                  ),
                  Selector<SettingsProvider, List<Country>>(
                    selector: (_, settings) => settings.countries,
                    builder: (_, countries, child) => SliverList(
                      delegate:
                          SliverChildBuilderDelegate((context, index) {
                        return CountryListTile(
                          displayName: displayName,
                          country: countries.elementAt(index),
                          language: language,
                          dialogTheme: dialogTheme,
                        );
                      }, childCount: countries.length),
                    ),
                  ),
                ],
              )),
    );
  }
}
