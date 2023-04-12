
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labook/routes/route_manager.dart';
import 'package:labook/utils/constants/assets_manager.dart';
import 'package:show_up_animation/show_up_animation.dart';
import '../../commons/common_libs.dart';

class SplashScreen extends StatefulWidget {

  SplashScreen({super.key}) {}

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final duration = const Duration(seconds: 3);

  @override
  void initState() {
    _handleOnInitialize();
    super.initState();
  }


  void _handleOnInitialize() async {
    Future.delayed(duration).then(
      (_) => Navigator.pushNamedAndRemoveUntil(
       context,
        AppRoutes.loginScreen,
        (route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).textScaleFactor;
    print(h);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShowUpAnimation(
              animationDuration: const Duration(seconds: 1),
              curve: Curves.easeIn,
              direction: Direction.horizontal,
              offset: -0.5,
              child:  Image.asset(AppAssets.splashLogo,
                  width: 250.w,
                  height: 100.h),
            ),
            const SizedBox(height: 40.0),
            ShowUpAnimation(
              animationDuration: const Duration(seconds: 1),
              curve: Curves.easeIn,
              direction: Direction.horizontal,
              offset: -1,
              delayStart: const Duration(seconds: 1),
              child: Text(
                'LABOOK',
                style: getBoldStyle(fontSize: 42,color: MyColors.white,fontWeight: FontWeight.w800),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
