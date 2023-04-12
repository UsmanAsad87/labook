import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:labook/commons/common_libs.dart';
import 'package:labook/commons/common_widgets/custom_button.dart';
import 'package:labook/commons/common_widgets/show_toast.dart';
import 'package:labook/utils/constants/assets_manager.dart';

import '../../../country_pic/country_list_picker.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _numberController = TextEditingController();
  bool show = true;
  String number = '';
  GlobalKey<FormState> numKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          actions: [
            IconButton(
              splashColor: Theme.of(context).scaffoldBackgroundColor,
              icon: ImageIcon(
                const AssetImage(
                  AppAssets.helpLogo,
                ),
                size: 22.h,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Image.asset(
                AppAssets.bgImgLogo,
                width: MediaQuery.of(context).size.width * 0.8,
              )),
              Spacer(
                flex: 1,
              ),
              Text(
                "Welcome to LABOOK!\nEnter your phone",
                style: getBoldStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 26.spMin,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 20.sp,
              ),
              Text("Phone",
                  style: getRegularStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.tertiary)),
              CountryListPicker(
                onCountryChanged: ((value) {
                  print(value.name.common);
                }),
                controller: _numberController,
                onChanged: (value) {
                  number = value.toString();
                  // do something
                },
                onTap: () {
                  setState(() {
                    show = false;
                  });
                },
                onFieldSubmitted: (value) {
                  setState(() {
                    show = true;
                  });
                },
                initialCountry: Countries.Colombia,
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                  padding: 0.h,
                  onPressed: () {
                    if (number.length < 7 || number.length > 14) {
                      showToast(msg: "Number is wrong formatted");
                    }
                    showToast(msg: "Number is: $number");
                  },
                  buttonText: "Next"),
              show
                  ? Padding(
                    padding:  EdgeInsets.only(top: 10.0.h),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.lock_outline,
                              size: 15.h,
                              color: Theme.of(context).colorScheme.tertiary),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text("100% Data Security",
                              style: getRegularStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).colorScheme.tertiary)),
                        ],
                      ),
                  )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
