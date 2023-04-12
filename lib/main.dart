import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labook/features/splash/splash_screen.dart';
import 'package:labook/routes/route_manager.dart';
import 'package:labook/utils/constants/app_constants.dart';
import 'package:labook/utils/thems/theme.dart';
void main() {
  runApp(const ProviderScope(child: MyApp()));
}
//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,) {
    MediaQueryData windowData =
    MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
    windowData = windowData.copyWith(
        textScaleFactor:1);
    return ScreenUtilInit(
        designSize:
        const Size(AppConstants.screenWidget, AppConstants.screenHeight),
        useInheritedMediaQuery: true,
        minTextAdapt: false,
        splitScreenMode: true,
        builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Ticket APP',
                theme: lightThemeData(context),
                darkTheme: darkThemeData(context),
                initialRoute: AppRoutes.userSplashScreen,
                onGenerateRoute: AppRoutes.onGenerateRoute,
              );
        });
  }
}

//
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context,) {
//     MediaQueryData windowData =
//     MediaQueryData.fromWindow(WidgetsBinding.instance!.window);
//     windowData = windowData.copyWith(
//         textScaleFactor:1);
//     return MediaQuery(
//       data: windowData,
//       child: ScreenUtilInit(
//           designSize:
//           const Size(AppConstants.screenWidget, AppConstants.screenHeight),
//           useInheritedMediaQuery: true,
//           minTextAdapt: true,
//           splitScreenMode: true,
//           builder: (context, child) {
//             return MaterialApp(
//               useInheritedMediaQuery: true,
//               debugShowCheckedModeBanner: false,
//               title: 'Ticket APP',
//               theme: lightThemeData(context),
//               darkTheme: darkThemeData(context),
//               initialRoute: AppRoutes.userSplashScreen,
//               onGenerateRoute: AppRoutes.onGenerateRoute,
//             );
//           }),
//     );
//   }
// }

