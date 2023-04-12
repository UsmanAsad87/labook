import 'package:flutter_svg/flutter_svg.dart';
import 'package:labook/utils/constants/assets_manager.dart';

import '../common_libs.dart';

// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final Function(String) onChanged;
//   final Function(String) onFieldSubmitted;
//   final TextInputType? inputType;
//   final bool obscure;
//   final IconData? icon;
//   final String? Function(String?)? validatorFn;
//   final Widget? leadingIcon;
//   final bool isSubscribe;
//   final double? horizontalPadding;
//   final Function() onTap;
//
//   const CustomTextField({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     required this.onChanged,
//     required this.onFieldSubmitted,
//     this.inputType,
//     this.leadingIcon,
//     required this.obscure,
//     this.validatorFn,
//     this.icon,
//     this.isSubscribe = false,
//     this.horizontalPadding,
//     required this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(
//           bottom: 0.h,
//           top: 5.h,
//           left: horizontalPadding ?? 20.w,
//           right: horizontalPadding ?? 20.w),
//       height: 45.h,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(60.r),
//           border: Border.all(
//             color: MyColors.blackColor,
//           )),
//       child: Center(
//         child: Row(
//           children: [
//             Expanded(
//               child: TextFormField(
//                 validator: validatorFn,
//                 obscureText: obscure,
//                 controller: controller,
//                 keyboardType: inputType,
//                 style: getSemiBoldStyle(),
//                 decoration: InputDecoration(
//                   contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
//                   hintText: hintText,
//                   hintStyle: getSemiBoldStyle(
//                       color: MyColors.themeColor.withOpacity(0.2)),
//                   enabledBorder: const OutlineInputBorder(
//                     borderSide:
//                         BorderSide(color: Colors.transparent, width: 2.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                         color: Theme.of(context)
//                             .colorScheme
//                             .onPrimary
//                             .withOpacity(0.2),
//                         width: 2.0),
//                   ),
//                   border: const OutlineInputBorder(),
//                   focusedErrorBorder: OutlineInputBorder(
//                     borderSide:
//                         BorderSide(color: Colors.transparent, width: 2.0),
//                   ),
//                   errorBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                         color: Theme.of(context).primaryColor.withOpacity(0.2),
//                         width: 2.0),
//                   ),
//                 ),
//                 onFieldSubmitted: onFieldSubmitted,
//                 onChanged: onChanged,
//               ),
//             ),
//             isSubscribe
//                 ? InkWell(
//                     onTap: onTap,
//                     child: Container(
//                         height: 40.h,
//                         padding: EdgeInsets.symmetric(horizontal: 10.w),
//                         alignment: Alignment.center,
//                         margin: EdgeInsets.all(5.sp),
//                         decoration: BoxDecoration(
//                             shape: BoxShape.rectangle,
//                             borderRadius: BorderRadius.circular(20.r),
//                             color: MyColors.themeColor),
//                         child: Text(
//                           'Subscribe',
//                           style: getSemiBoldStyle(
//                               fontSize: 12.sp, color: MyColors.white),
//                         )),
//                   )
//                 : Container(
//                     width: 40.w,
//                     height: 40.h,
//                     padding: EdgeInsets.all(10.sp),
//                     alignment: Alignment.center,
//                     margin: EdgeInsets.all(5.sp),
//                     decoration: const BoxDecoration(
//                         shape: BoxShape.circle, color: MyColors.themeColor),
//                     child: SvgPicture.asset(
//                       AppAssets.qrIcon,
//                       color: MyColors.white,
//                     ),
//                   )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
class CustomSearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String) onChanged;
  final Function(String) onFieldSubmitted;
  final TextInputType? inputType;
  final IconData? icon;
  final Widget? leadingIcon;
  final Function() onTap;
  final String? Function(String?)? validatorFn;
  final FocusNode focusNode;

  const CustomSearchTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.onChanged,
    required this.onFieldSubmitted,
    this.inputType,
    this.leadingIcon,
    this.icon, required this.onTap, this.validatorFn, required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0.h),
      child: Container(
        width: double.infinity,
        height: 35.h,
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(5.r)),
        child: TextFormField(
          focusNode: focusNode,
          controller: controller,
          keyboardType: inputType,
          style: getMediumStyle(
              color: Theme.of(context).colorScheme.secondary, fontSize: 14.spMin),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
            prefixIcon: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: IconButton(
                splashColor: Theme.of(context).scaffoldBackgroundColor,
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                icon: ImageIcon(
                  const AssetImage(
                    AppAssets.helpLogo,
                  ),
                  size: 20.h,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: onTap,
              ),
            ),
            hintText: hintText,
            hintStyle: getMediumStyle(
                color: Theme.of(context).colorScheme.tertiary, fontSize: 14.spMin),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  width: 1.0.h),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  width: 1.0.h),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  width: 1.0.h),
            ),
            focusedErrorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: MyColors.errorColor,
                  width: 1.0.h),
            ),
            errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: MyColors.errorColor,
                  width: 1.0.h),
            ),
          ),
          onFieldSubmitted: onFieldSubmitted,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
