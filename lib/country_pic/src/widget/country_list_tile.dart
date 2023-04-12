import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labook/utils/thems/styles_manager.dart';
import '../model/country.dart';
import '../model/languages.dart';
import '../theme/dialog_theme.dart';
import '../model/names.dart';

class CountryListTile extends StatelessWidget {
  const CountryListTile({
    super.key,
    required this.country,
    required this.language,
    this.dialogTheme = const DialogThemeData(),
    this.displayName = Names.common,
  });

  final Country country;
  final Languages language;
  final DialogThemeData dialogTheme;
  final Names displayName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(vertical: 8.h),
            child: InkWell(
              onTap: () {
                Navigator.pop(context, country);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/flags/${country.iso_3166_1_alpha2.toLowerCase()}.png",
                    width: 20.w,
                    height: 20.h,
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
            ),
          ),
          Divider(
            thickness: 1.h,
            color: Theme.of(context).colorScheme.secondaryContainer,
          )
        ],
      ),
    );
  }
}
