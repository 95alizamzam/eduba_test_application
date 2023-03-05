import 'package:eduba_test_app/core/colors/app_colors.dart';
import 'package:eduba_test_app/features/videos/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/navigation/navigation_services.dart';
import '../core/service_locator/sl.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Future.delayed(
    //   const Duration(seconds: 1),
    //   () => sl<NavigationServices>().goTo(
    //     context: context,
    //     clean: true,
    //     targetScreen: const HomeScreen(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // TweenAnimationBuilder(
            //   duration: const Duration(seconds: 2),
            //   tween: Tween<double>(begin: 0, end: 1),
            //   builder: (context, value, child) => CircularProgressIndicator(
            //     backgroundColor: red,
            //     color: white,
            //     value: value,
            //     strokeWidth: 4,
            //   ).center(),
            //   onEnd: () {
            //     // sl<NavigationServices>().goTo(
            //     //   context: context,
            //     //   clean: true,
            //     //   targetScreen: const HomeScreen(),
            //     // );
            //   },
            // ),
            SizedBox(height: 10.h),
            TweenAnimationBuilder(
              duration: const Duration(seconds: 2),
              tween: Tween<double>(begin: 0.2, end: 1),
              builder: (context, value, child) => Text(
                'Loading ...',
                style: TextStyle(
                  fontSize: 20.sp,
                  color: red.withOpacity(value),
                ),
              ),
              onEnd: () {
                sl<NavigationServices>().goTo(
                  context: context,
                  clean: true,
                  targetScreen: const HomeScreen(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
