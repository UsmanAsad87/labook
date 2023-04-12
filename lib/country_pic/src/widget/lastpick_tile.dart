import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labook/commons/common_libs.dart';
import '../model/country.dart';
import '../theme/dialog_theme.dart';
import '../model/languages.dart';
import '../model/names.dart';

class LastPickTile extends StatelessWidget {
  final DialogThemeData dialogTheme;
  final Country country;
  final Languages language;
  final Names displayName;
  const LastPickTile({
    super.key,
    required this.dialogTheme,
    required this.country,
    required this.language,
    this.displayName = Names.common,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Image.asset(
                        "assets/flags/${country.iso_3166_1_alpha2.toLowerCase()}.png",
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Text(
                      displayName == Names.common
                          ? country.name.common
                          : country.name.official,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: getMediumStyle(
                          fontSize: 14.spMin,
                          color: Theme.of(context).colorScheme.secondary),
                    )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Icon(
                      Icons.check,
                      color: Theme.of(context).colorScheme.tertiary,
                      size: 22.h,
                    )),
              ],
            ),
          ),
          Divider(
            thickness: 1.h,
            color: Theme.of(context).colorScheme.secondaryContainer,
          )
        ],
      ),
    );

    Column(children: [
      SizedBox(
        height: dialogTheme.tileHeight,
        child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Image.asset(
                "assets/flags/${country.iso_3166_1_alpha2.toLowerCase()}.png",
                width: 20.w,
                height: 20.h,
              ),
            ),
            title: Text(
              (displayName == Names.common)
                  ? country.name.common
                  : country.name.official,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
              style: getMediumStyle(
                  fontSize: 14.spMin,
                  color: Theme.of(context).colorScheme.secondary),
            ),
            trailing: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Icon(
                  dialogTheme.tilesTheme.lastPickIcon.icon,
                  color: Theme.of(context).colorScheme.tertiary,
                  size: 18.h,
                )),
            onTap: null),
      )
    ]);
  }
}
